extends Node2D


func _ready() -> void:
	pass

func _on_retry_pressed() -> void:
	# TODO add code so that it will go back to last fight (not restart whole level)
	GlobalScene.load_next_scene(GlobalScene.GAME)

func _on_quit_pressed() -> void:
	GlobalScene.load_next_scene(GlobalScene.HOME_MENU)
	
