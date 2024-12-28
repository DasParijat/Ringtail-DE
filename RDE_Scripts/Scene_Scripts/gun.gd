extends Node2D

@export var gun_index : int = 0 # 0 is primary gun, 1 is secondary gun

@onready var player_res : PlayerRes = get_parent().player_res
@onready var gun_res = player_res.gun_array[gun_index]
@onready var bullet_res : BulletRes = gun_res.bullet_res

func _input(event: InputEvent) -> void:
	match(gun_res.is_automatic):
		true:
			if event.is_action("shoot"):
				shoot()
		false:
			if event.is_action_pressed("shoot"):
				shoot()
			
func shoot():
	var bullet = preload("res://RDE_Scenes/bullet.tscn").instantiate()
	bullet.bullet_res = bullet_res
	bullet.gun_res = gun_res
	
	bullet.transform = $".".global_transform
	get_tree().root.add_child(bullet)
