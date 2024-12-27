extends CharacterBody2D
# Handles code that every playable character uses

@onready var player_res : PlayerRes = get_parent().player_res
@onready var sprite : Sprite2D = $Sprite2D

@export var sprite_texture_path : String = "res://RDE_Images/nf Player.png"

var speed_modifier : float = 1

func _ready() -> void:
	sprite.texture = load(sprite_texture_path) 
	
	# testing gun array
	print(player_res.def_primary_gun.name)
	print(player_res.def_secondary_gun.name)
	print(player_res.gun_array)
	
	player_res.reset_speed()
	player_res.reset_power_rate()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	movement(player_res.cur_speed)

func movement(cur_speed : float) -> void:
	look_at(get_global_mouse_position())
	
	cur_speed = player_res.base_speed
	if Input.is_action_pressed("sprint"):
		cur_speed = player_res.sprint_speed
	if Input.is_action_pressed("rest"):
		cur_speed = player_res.rest_speed
	
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down") 
	velocity = input_direction * (cur_speed * speed_modifier)
	
	move_and_slide()

func set_speedmod(new_val : float) -> void:
	speed_modifier = new_val
