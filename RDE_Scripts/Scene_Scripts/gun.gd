extends Area2D

@export var gun_index : int = 0 # 0 is primary gun, 1 is secondary gun

@onready var player_res : PlayerRes = get_parent().player_res
@onready var gun_res = player_res.gun_array[gun_index]

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):
		print(gun_res.name)
		print("shoot")
		
