extends CharacterBody2D

@export var player_res : PlayerRes
var speed_modifier : float 

func _ready() -> void:
	speed_modifier = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	movement(player_res.base_speed)

func movement(cur_speed : float):
	look_at(get_global_mouse_position())
	
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down") 
	velocity = input_direction * (cur_speed * speed_modifier)
	
	move_and_slide()
