extends Node2D

@export var mob_res : MobRes

@export var explosion_texture : Texture
@export var flash1_texture : Texture
@export var flash2_texture : Texture

@export var explosion_init_size = Vector2(1, 1)
@export var explosion_max_size = Vector2(5, 5)

@export var explosion_wait : float = 0.5
@export var flash_amt : int = 3

@onready var controller : MobController = $MobController
@onready var base : BaseMob = $base_mob
@onready var sprite : Sprite2D = $base_mob/Sprite2D

func _ready() -> void:
	mob_res.collision_dmg = 0
	explosion(sprite)
	
func explosion(node : Node):
	scale = Vector2(explosion_init_size)
	
	# TODO finish flashing animation
	for i in range(flash_amt):
		await GlobalTime.local_wait(explosion_wait / flash_amt)
	
	mob_res.collision_dmg = 2
	
	var tween = create_tween()
	tween.set_parallel(true)
	
	tween.tween_property(node, "scale", explosion_max_size, 1).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(node, "modulate", Color(1,1,1,0), 1).set_ease(Tween.EASE_IN_OUT)
	
	await tween.finished
	queue_free()
