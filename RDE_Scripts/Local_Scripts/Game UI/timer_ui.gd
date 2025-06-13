extends Control

@onready var time_label : Label = $PanelContainer/TimeLabel

var cur_time : int

var minutes : int = floor(cur_time / 60)
var seconds : int = cur_time % 60
	
func _ready() -> void:
	GlobalSignal.connect("game_won", Callable(self, "_on_game_won"))
	
	game_start_anim(0.3)

func game_start_anim(duration : float) -> void:
	var tween = create_tween()
	
	tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "modulate:a", 1, duration)
	
func _process(_delta : float) -> void:
	# TODO add code to handle Timed mode
	# Timer goes down instead of up, gets time from fight res, and goes red at under 10 seconds
	cur_time = GlobalFightStats.fight_stats["time"]
	
	time_label.text = GlobalTime.get_time_format(cur_time)

func _on_game_won() -> void:
	var tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)

	tween.tween_property($".", "modulate:a", 0, GlobalScene.victory_fade_rate)
	await tween.finished
	$".".hide()

	await GlobalScene.off_victory

	$".".show()
	tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($".", "modulate:a", 1, GlobalScene.victory_fade_rate)
