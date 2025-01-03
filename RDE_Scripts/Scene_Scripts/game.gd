extends Node2D

var is_paused : bool = false

func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause_game()

# https://youtu.be/JEQR4ALlwVU?si=3ryPHdJG3ungIi0M 
# pause tutorial link, go back when making UI
func pause_game() -> void:
	if is_paused:
		print(">>PAUSED<<")
		Engine.time_scale = 1
	else:
		Engine.time_scale = 0
		
	is_paused = not is_paused
	
