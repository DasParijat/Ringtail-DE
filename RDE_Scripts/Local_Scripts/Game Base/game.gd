extends Node2D

@onready var pause_menu = $pause_menu
@onready var level : LevelRes = GlobalScene.next_level

@onready var fight_res : FightRes 

signal fight_res_set

func _ready() -> void:
	pause_menu.hide() 
	
	if GlobalScene.prev_scene == GlobalScene.MAIN_MENU:
		level.index = 0
		
	print("LEVEL INDEX: ", level.index)
	GlobalSignal.connect("game_won", Callable(self, "_on_game_won"))
	GlobalSignal.connect("game_over", Callable(self, "_on_game_over"))
	#level.index = level.order.size() - 1 # This code is for if I want to run last in order
	next_in_order(0)

func _process(delta: float) -> void:
	if not GlobalTime.is_paused:
		Engine.time_scale = GlobalTime.cur_time_scale

func _unhandled_input(event : InputEvent) -> void:
	if event.is_action_pressed("pause"):
		pause_game()
# Menu Tutorial: https://youtu.be/JEQR4ALlwVU?si=3ryPHdJG3ungIi0M 

func next_in_order(increment : int) -> void:
	if increment > 0:
		for i in range(increment):
			level.next_sequence()
	
	#GlobalScene.cur_order = level.index
	if level.sequence_end:
		# Go back to main menu
		print("sequence end")
		level.sequence_end = false
		
		#GlobalScene.emit_signal("quit_to_menu")
		GlobalScene.load_next_scene(GlobalScene.MAIN_MENU)
		
		print("LEVEL INDEX: ", level.index)
		return
		
	if level.order[level.index] is FightRes:
		GlobalScene.cur_scene_type = GlobalScene.SceneType.FIGHT
		fight_res = level.order[level.index]
		print("LEVEL INDEX: ", level.index)
		
		fight_res_set.emit()
		return
	
	if level.order[level.index] is CutsceneRes:
		GlobalScene.cur_scene_type = GlobalScene.SceneType.CSCENE
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
	print("game won on GAME end (printed from game scene script)")
	
	GlobalScene.on_victory.emit()
	await GlobalScene.off_victory
	
	GlobalFightStats.fight_stats["total_time"] = 0.0
	GlobalFightStats.fight_stats["num_of_deaths"] = 0
	next_in_order(1)

func _on_game_over() -> void:
	GlobalFightStats.fight_stats["num_of_deaths"] += 1
