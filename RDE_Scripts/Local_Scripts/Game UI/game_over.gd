extends Node2D

@export var background : Control
@export var heading_text : Label 
@export var button_container : Container
@export var transition_fade : Control

# TODO add tween code for transition fade

func _on_retry_pressed() -> void:
	GlobalScene.load_next_scene(GlobalScene.GAME)

func _on_quit_pressed() -> void:
	GlobalScene.load_next_scene(GlobalScene.HOME_MENU)
