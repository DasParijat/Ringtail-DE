extends Node2D

@export var mob_res : MobRes 
@onready var base_boss : CharacterBody2D = $base_mob

# TODO Make a smaller version of the ringtail spirte. he's too fat
func _ready() -> void:
	print("boss added")
	position = base_boss.position

func _process(delta: float) -> void:
	pass
