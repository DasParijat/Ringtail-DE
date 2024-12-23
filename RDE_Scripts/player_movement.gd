extends CharacterBody2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	movement(10, 10)

func movement(cur_speed, speed_modifier):
	look_at(get_global_mouse_position())
	# non-dash movement
	if !(Input.is_action_pressed("dash")):
		speed_modifier = 1
	# dash movement
	else:
		speed_modifier = 3
	
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
		
	move_and_slide()
