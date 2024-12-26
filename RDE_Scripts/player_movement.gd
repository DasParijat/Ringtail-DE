extends CharacterBody2D

@onready var player_res : PlayerRes = get_parent().player_res
var speed_modifier : float = 1

func _ready() -> void:
	player_res.reset_speed()
	player_res.reset_power_rate()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	movement(player_res.cur_speed)

func movement(cur_speed : float) -> void:
	look_at(get_global_mouse_position())
	
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down") 
	velocity = input_direction * (cur_speed * speed_modifier)
	
	move_and_slide()

func set_speedmod(new_val : float) -> void:
	speed_modifier = new_val
