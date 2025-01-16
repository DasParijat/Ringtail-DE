extends Node2D

@onready var pause_menu = $pause_menu

#@onready var is_paused : bool = G.is_paused

# TODO Fix issue of it still being paused when going back into the game from main menu
# probably have to deload stuff when quiting

func _ready() -> void:
	pause_menu.hide() 

func _process(delta: float) -> void:
	if not GlobalTime.is_paused:
		Engine.time_scale = GlobalTime.cur_time_scale
	
	if Input.is_action_just_pressed("pause"):
		pause_game()

# https://youtu.be/JEQR4ALlwVU?si=3ryPHdJG3ungIi0M 

func pause_game() -> void:
	if GlobalTime.is_paused:
		print(">>PAUSED<<")
		pause_menu.hide()
	else:
		pause_menu.show()
		Engine.time_scale = 0
		
	GlobalTime.is_paused = not GlobalTime.is_paused
	#print(GlobalTime.is_paused)
	
