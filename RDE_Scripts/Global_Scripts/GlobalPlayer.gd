extends Node

var power_activated : bool = false # Handled in player specifc (Oswald)
var is_resting : bool = false
var is_aiming : bool = false
var is_moving : bool = false

func input_handling() -> void:
	## Handles Input keys to booleans
	is_resting = action_key("rest")
	is_aiming = action_key("aim")

	is_moving = (action_key("move_up") or 
				action_key("move_down") or
				action_key("move_left") or
				action_key("move_right"))

func action_key(action_name : String) -> bool:
	return Input.is_action_pressed(action_name) and not GlobalTime.is_paused
