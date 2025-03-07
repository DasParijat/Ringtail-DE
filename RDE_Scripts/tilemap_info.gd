extends Node2D

@export var cam_border_x : float = 600
@export var cam_border_y : float = 400

func _ready() -> void:
	GlobalScene.cam_border_x = cam_border_x
	GlobalScene.cam_border_y = cam_border_y
