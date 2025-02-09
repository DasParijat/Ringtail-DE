extends Node2D

@onready var pause_menu = $pause_menu
@onready var level : LevelRes = GlobalScene.next_level

@onready var fight_res : FightRes 
signal fight_res_set
#@onready var is_paused : bool = G.is_paused

# TODO Fix issue of it still being paused when going back into the game from main menu
# probably have to deload stuff when quiting

func _ready() -> void:
	pause_menu.hide() 
	print("LEVEL INDEX: ", level.index)
	GlobalSignal.connect("game_won", Callable(self, "_on_game_won"))
	
	#level.index = level.order.size() - 2 # This code is for if I want to run last in order
	next_in_order(0)

func _process(delta: float) -> void:
	if not GlobalTime.is_paused:
		Engine.time_scale = GlobalTime.cur_time_scale
	
	if Input.is_action_just_pressed("pause"):
		pause_game()

# Menu Tutorial: https://youtu.be/JEQR4ALlwVU?si=3ryPHdJG3ungIi0M 

func next_in_order(increment : int) -> void:
	if increment > 0:
		for i in range(increment):
			level.next_sequence()
	
	if level.sequence_end:
		# Go back to main menu
		print("sequence end")
		GlobalScene.load_next_scene(GlobalScene.MAIN_MENU)
		print("LEVEL INDEX: ", level.index)
		return
		
	if level.order[level.index] is FightRes:
		fight_res = level.order[level.index]
		print("LEVEL INDEX: ", level.index)
		fight_res_set.emit()
		return
	
	if level.order[level.index] is CutsceneRes:
		return
		
func pause_game() -> void:
	if GlobalTime.is_paused:
		print(">>PAUSED<<")
		pause_menu.hide()
	else:
		pause_menu.show()
		Engine.time_scale = 0
		
	GlobalTime.is_paused = not GlobalTime.is_paused
	#print(GlobalTime.is_paused)
	
func _on_game_won() -> void:
	print("game won on GAME end")
	next_in_order(1)
	
func _on_tree_exiting() -> void:
	level.index = 0
