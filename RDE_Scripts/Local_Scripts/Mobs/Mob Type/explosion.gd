extends Node2D

@export var mob_res : MobRes

@export var explosion_init_size = Vector2(1, 1)
@export var explosion_max_size = Vector2(2, 2)

@export var explosion_wait : float = 3.0

@onready var controller : MobController = $MobController
@onready var base : BaseMob = $base_mob

func _ready() -> void:
	print("BOOOOOOOOOOOOOOOOOOOOOM")


func _process(delta: float) -> void:
	#controller.action_handling(1)
	pass
