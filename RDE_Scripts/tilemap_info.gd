extends Node2D

@export var cam_border_x : float = 1700
@export var cam_border_y : float = 1200

@export var base_canvas_mod : Color = Color(255, 255, 255, 255)
# RGT Plains canvas mod hex - f8bfa5

func _ready() -> void:
	GlobalScene.cam_border_x = cam_border_x
	GlobalScene.cam_border_y = cam_border_y
