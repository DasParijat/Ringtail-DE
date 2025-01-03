extends Control

@onready var main = $"../.."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
func _on_resume_b_pressed() -> void:
	main.pause_game()

func _on_settings_b_pressed() -> void:
	pass # Replace with function body.
	#get_tree().change_scene_to_file("insert file link to scene")


func _on_quit_b_pressed() -> void:
	get_tree().change_scene_to_file("res://RDE_Scenes/main_menu.tscn")
