extends Timer

var cur_pos : Vector2
var prev_pos : Vector2

func _ready() -> void:
	start()

func has_moved() -> bool:
	if ceil(cur_pos) == ceil(prev_pos):
		return false
	return true

func _on_timeout() -> void:
	cur_pos = get_parent().global_position
	#print("is triggered: ", !(has_moved()) and GlobalPlayer.is_moving, " cur pos: ", cur_pos, " prev_pos: ", prev_pos)
	
	if !(has_moved()) and GlobalPlayer.is_moving:
		get_parent().global_position = Vector2(0, 20)
	
	prev_pos = cur_pos
	start()
