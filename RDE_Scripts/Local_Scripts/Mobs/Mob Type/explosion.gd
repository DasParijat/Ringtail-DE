extends Node2D

@export var mob_res : MobRes

@export var explosion_texture : Texture
@export var flash1_texture : Texture
@export var flash2_texture : Texture

@onready var explosion_dmg : float = 2
@onready var explosion_init_size = Vector2(1, 1)
@onready var explosion_max_size = Vector2(5, 5)

@onready var explosion_wait : float = 3
@onready var flash_amt : int = 9

@onready var controller : MobController = $MobController
@onready var base : BaseMob = $base_mob
@onready var sprite : Sprite2D = $base_mob/Sprite2D

func _ready() -> void:
	#print("explosion spawned")
	mob_res.collision_dmg = 0
	explosion(sprite)
	
func explosion(node : Node):
	scale = Vector2(explosion_init_size)
	await warning_animation()
	
	mob_res.collision_dmg = explosion_dmg
	
	var tween = create_tween()
	tween.set_parallel(true)
	
	tween.tween_property(node, "scale", explosion_max_size, 1).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(node, "modulate", Color(1,1,1,0), 1).set_ease(Tween.EASE_IN_OUT)
	
	# Cutoff point where explosion boom stops dealing damage
	if modulate.a < 0.2:
		mob_res.collision_dmg = 0
		
	await tween.finished
	queue_free()

func warning_animation() -> void:
	## Sprite flashes during warning phase
	for i in range(flash_amt):
		if i % 2 == 0:
			sprite.texture = flash1_texture
		else:
			sprite.texture = flash2_texture
			
		await GlobalTime.local_wait(explosion_wait / flash_amt)
	sprite.texture = explosion_texture
