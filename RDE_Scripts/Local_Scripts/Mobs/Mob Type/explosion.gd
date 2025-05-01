extends Node2D

@export var mob_res : MobRes

@export var explosion_init_size = Vector2(1, 1)
@export var explosion_max_size = Vector2(5, 5)

@export var explosion_wait : float = 0.5

@onready var controller : MobController = $MobController
@onready var base : BaseMob = $base_mob

func _ready() -> void:
	explosion()
	
func explosion():
	scale = Vector2(explosion_init_size)
	await GlobalTime.local_wait(explosion_wait)
	
	var tween = create_tween()
	tween.set_parallel(true)
	
	# TODO possibly apply tween to sprite within base_mob
	tween.tween_property($".", "scale", explosion_max_size, 5)#.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property($".", "modulate", Color(1,1,1,0), 5)#.set_ease(Tween.EASE_IN_OUT)
	
	await tween.finished
	queue_free()
