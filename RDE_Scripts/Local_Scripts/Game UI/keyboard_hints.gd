extends CanvasLayer

@onready var parent_container : Container = $CenterContainer

@onready var rest_hint : HBoxContainer = $"CenterContainer/VboxContainer/Rest Hint"
@onready var power_hint : HBoxContainer = $"CenterContainer/VboxContainer/Power Hint"
@onready var shoot_hint : HBoxContainer = $"CenterContainer/VboxContainer/Shoot Hint"
@onready var switch_hint : HBoxContainer = $"CenterContainer/VboxContainer/Switch Hint"
@onready var reload_hint : HBoxContainer = $"CenterContainer/VboxContainer/Reload Hint"

@onready var rest_hint_label: Label = $"CenterContainer/VboxContainer/Rest Hint/Label"

# Colors
# NOTE - The colors used primarily work with Ringtail/Oswald Fight
#		Could make it more flexible, but the scope of RDE doesn't require so
var usable_color : Color# = Color(1, 0.98, 0.86, 0.9)
var in_use_color : Color# = Color(1.5, 1.48, 1.26, 0.9)
var disabled_color : Color# = Color(1, 0.98, 0.86, 0.4)

var using_alpha_deviation : float = 0.3
var disabled_alpha_deviation : float = -0.5

func _ready() -> void:
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))
	GlobalSignal.connect("game_won", Callable(self, "_on_game_won"))
	
	# Setting colors based of parent_container modulate
	usable_color = parent_container.modulate
	in_use_color = Color(parent_container.modulate.r + using_alpha_deviation,
							parent_container.modulate.g + using_alpha_deviation,
							parent_container.modulate.b + using_alpha_deviation,
							parent_container.modulate.a)
	disabled_color = Color(parent_container.modulate.r,
							parent_container.modulate.g,
							parent_container.modulate.b,
							parent_container.modulate.a + disabled_alpha_deviation)

	game_start_anim(0.3)
	
func game_start_anim(duration : float) -> void:
	parent_container.modulate.a = 0
	var tween = create_tween()
	
	tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(parent_container, "modulate:a", usable_color.a, duration)
	
func _on_get_cur_stats(type, stats) -> void:
	## Always gets current stats 
	match(type):
		"PLAYER":
			rest_ui(stats)
			switch_ui(stats)
			power_ui(stats)
		"GUN":
			shoot_ui(stats)
			reload_ui(stats)

func rest_ui(_stats : Dictionary) -> void:
	if GlobalPlayer.is_resting: rest_hint.modulate = in_use_color
	else: rest_hint.modulate = usable_color 

func power_ui(stats : Dictionary) -> void:
	if stats["cur_power"] <= 1:
		power_hint.modulate = disabled_color
	else:
		if Input.is_action_pressed("sprint"): power_hint.modulate = in_use_color
		else: power_hint.modulate = usable_color 
	
func shoot_ui(stats : Dictionary) -> void:
	if stats["is_reloading"]:
		shoot_hint.modulate = disabled_color 
	else:
		shoot_hint.modulate = usable_color 
	
func switch_ui(_stats : Dictionary) -> void:
	if Input.is_action_just_pressed("switch_weapon"): switch_hint.modulate = in_use_color
	else: switch_hint.modulate = usable_color 
	
func reload_ui(stats : Dictionary) -> void:
	if stats["is_reloading"]:
		reload_hint.modulate = disabled_color 
	else:
		if Input.is_action_pressed("reload"): reload_hint.modulate = in_use_color
		else: reload_hint.modulate = usable_color 

func _on_game_won() -> void:
	var tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)

	tween.tween_property(parent_container, "modulate", Color(1,1,1,0), GlobalScene.victory_fade_rate)
	await tween.finished
	parent_container.hide()

	await GlobalScene.off_victory

	parent_container.show()
	tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(parent_container, "modulate", Color(1,1,1,1), GlobalScene.victory_fade_rate)
