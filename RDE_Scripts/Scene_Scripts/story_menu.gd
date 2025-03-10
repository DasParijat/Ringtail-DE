extends Control

var selected_fight : String = "" # Get info on what fight the player is looking at from the fight buttons

func _process(delta: float) -> void:
	print("selected fight: ", selected_fight)
