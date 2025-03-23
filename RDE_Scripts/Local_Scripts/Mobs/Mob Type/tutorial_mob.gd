extends Node2D

# TODO work on tutorial attacks

@export var mob_res : MobRes

@export var attack_min : int = 1
@export var attack_max : int = 4

@onready var controller : MobController = $MobController
@onready var base : BaseMob = $base_mob

func _ready() -> void:
	# base.set_default_params({"move_torward_player": {"offset": 1, "delay": 0, "speed": 50, "smooth": 100, "length": 1}})
	pass


func _process(delta: float) -> void:
	#controller.action_handling(1)
	pass
