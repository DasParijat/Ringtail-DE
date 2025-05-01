extends Node2D

@export var mob_res : MobRes

@export var explosion_init_size = Vector2(1, 1)
@export var explosion_max_size = Vector2(5, 5)

@export var explosion_wait : float = 0.5

@onready var controller : MobController = $MobController
@onready var base : BaseMob = $base_mob

func _ready() -> void:
	explosion($"base_mob/Sprite2D")
	
func explosion(node : Node):
	scale = Vector2(explosion_init_size)
	await GlobalTime.local_wait(explosion_wait)
	
	var tween = create_tween()
	tween.set_parallel(true)
	
	tween.tween_property(node, "scale", explosion_max_size, 1).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(node, "modulate", Color(1,1,1,0), 1).set_ease(Tween.EASE_IN_OUT)
	
	await tween.finished
	queue_free()
