extends Control

@onready var time_label : Label = $PanelContainer/TimeLabel

var cur_time : int

var minutes : int = floor(cur_time / 60)
var seconds : int = cur_time % 60
	
func _ready() -> void:
	if not (GlobalSettings.visible_timer or "timed" in GlobalScene.next_level_modes):
		hide()
		return
		
	GlobalSignal.connect("game_won", Callable(self, "_on_game_won"))
	time_label.modulate = Color(1,1,1)
	
	game_start_anim(0.3)

func game_start_anim(duration : float) -> void:
	var tween = create_tween()
	
	tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "modulate:a", 1, duration)
	
func _process(_delta : float) -> void:
	if "timed" in GlobalScene.next_level_modes:
		cur_time = get_time_to_beat() - GlobalFightStats.fight_stats["time"]
		if cur_time <= floor(get_time_to_beat() / 3):
			time_label.modulate = Color(1,0.3,0.3)
			
		if cur_time <= 0 and !GlobalScene.on_victory_screen:
			GlobalSignal.emit_signal("update_player_hp", -1000)
	else:
		cur_time = GlobalFightStats.fight_stats["time"]
	
	time_label.text = GlobalTime.get_time_format(cur_time)

func get_time_to_beat() -> int:
	if GlobalScene.cur_scene_type == GlobalScene.SceneType.FIGHT:
		var cur_level : LevelRes = GlobalScene.next_level
		return cur_level.order[cur_level.index].min_win_time
	return 10 # default min win time

func _on_game_won() -> void:
	var tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)

	tween.tween_property($".", "modulate:a", 0, GlobalScene.victory_fade_rate)
	await tween.finished
	$".".hide()

	await GlobalScene.off_victory
	
	time_label.modulate = Color(1,1,1)
	$".".show()
	tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($".", "modulate:a", 1, GlobalScene.victory_fade_rate)
