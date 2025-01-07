extends Node2D

@onready var pause_menu = $UICanvasLayer/pause_men

var is_paused : bool = false

# TODO Fix issue of it still being paused when going back into the game from main menu
# probably have to deload stuff when quiting

func _ready() -> void:
	pause_menu.hide() 

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause_game()

# https://youtu.be/JEQR4ALlwVU?si=3ryPHdJG3ungIi0M 

func pause_game() -> void:
	if is_paused:
		print(">>PAUSED<<")
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
		
	is_paused = not is_paused
	
