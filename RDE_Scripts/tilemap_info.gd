extends Node2D

@export var cam_border_x : float = 1700
@export var cam_border_y : float = 1200

func _ready() -> void:
	GlobalScene.cam_border_x = cam_border_x
	GlobalScene.cam_border_y = cam_border_y
