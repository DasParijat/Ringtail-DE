extends Control

func _ready() -> void:
	# TODO - Add animation that plays when opening main menu
	pass # Replace with function body.

func _on_play_b_pressed() -> void:
	## Close main menu, opens fight menu
	pass # Replace with function body.


func _on_settings_b_pressed() -> void:
	## Close mani menu, opens settings
	pass # Replace with function body.


func _on_credits_b_pressed() -> void:
	## Close main menu, opens credits
	pass # Replace with function body.


func _on_quit_b_pressed() -> void:
	## Quits game entirely
	get_tree().quit()
