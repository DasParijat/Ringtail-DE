extends Control

var mob_res : MobRes

var max_hp : float = -1
var cur_hp : float = -1 

@onready var boss_name: Label = $BossName

@export var num_of_bars : int = 3
@export var max_bar_darkness : int = 175

var hp_bars : Array = []

func _ready() -> void:
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))
	GlobalSignal.connect("game_won", Callable(self, "_on_game_won"))
	
	#await GlobalTime.local_wait(0.1)
	game_start_anim(0.3)
	
func game_start_anim(duration : float) -> void:
	var tween = create_tween()
	
	tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "modulate:a", 1, duration)
	
func _on_get_cur_stats(type, stats) -> void:
	match(type):
		"MAIN_BOSS_START":
			## Setup only
			# Remove previous bar if any
			if get_child_count() > 2:
				for i in range(num_of_bars):
					remove_child(get_child(i + 2))
			
			max_hp = stats["max_hp"]
			mob_res = stats["mob_res"]
			num_of_bars = mob_res.num_of_bars
			
			set_boss_hp_bar()
		"MAIN_BOSS":
			## Constantly updating vars
			cur_hp = stats["cur_hp"]
	
func set_boss_hp_bar() -> void:
	boss_name.text = mob_res.display_name

	var num_of_childs = get_child_count() 
	# Used to make sure hp bars don't overlap with pre-added nodes

	for i in range(num_of_bars):
		var bar = create_hp_bar(floor(max_hp / num_of_bars) * i, floor(max_hp / num_of_bars) * (i + 1))
		bar.name = "HPBar_" + str(i + 1)
		
		add_child(bar)
		hp_bars.append(get_child(i + num_of_childs))

func create_hp_bar(min : float, max : float) -> ProgressBar:
	var bar = ProgressBar.new()
	var style = StyleBoxFlat.new()
	var bg_style = StyleBoxFlat.new()
	
	bar.min_value = min
	bar.max_value = max
	
	bar.set_anchors_preset(Control.PRESET_CENTER_TOP)
	bar.position = Vector2(-250, 15)
	
	bar.custom_minimum_size = Vector2(500, 20)
	bar.scale = Vector2(1.52, 1.52)
	bar.pivot_offset = Vector2(250, 0)
	bar.show_percentage = false
	
	style.set_corner_radius_all(4)
	style.bg_color = mob_res.color
	style.set_content_margin_all(0)
	
	bg_style.set_corner_radius_all(4)
	bg_style.bg_color = Color8(mob_res.hp_bg_color.r8, mob_res.hp_bg_color.g8, mob_res.hp_bg_color.b8, 
							  (max_bar_darkness / num_of_bars))
	bg_style.set_content_margin_all(0)
	
	bar.add_theme_stylebox_override("fill", style)
	bar.add_theme_stylebox_override("background", bg_style)
	
	return bar

func _process(_delta: float) -> void:
	if cur_hp > -1:
		for bar in hp_bars: 
			update_bar(bar, cur_hp, 0.5)
	pass
	
func update_bar(bar : ProgressBar, new_hp : float, rate : float) -> void:
	bar.value = new_hp
	
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(bar, "value", new_hp, rate)
	
func _on_game_won() -> void:
	var tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)

	tween.tween_property($".", "modulate", Color(1,1,1,0), GlobalScene.victory_fade_rate)
	await tween.finished
	$".".hide()

	await GlobalScene.off_victory
	if not GlobalScene.cur_scene_type == GlobalScene.SceneType.FIGHT:
		await GlobalScene.off_victory

	$".".show()
	tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($".", "modulate", Color(1,1,1,1), GlobalScene.victory_fade_rate)
