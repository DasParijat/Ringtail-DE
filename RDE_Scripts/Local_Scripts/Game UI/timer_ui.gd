extends Control

@onready var time_label : Label = $PanelContainer/TimeLabel

var cur_time : int

var minutes : int = floor(cur_time / 60)
var seconds : int = cur_time % 60
	
func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	cur_time = floor(GlobalFightStats.fight_stats["time"])
	
	minutes = floor(cur_time / 60)
	seconds = cur_time % 60

	time_label.text = "%d:%02d" % [minutes, seconds]
