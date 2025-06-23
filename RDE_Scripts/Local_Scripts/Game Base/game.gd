extends Node2D

@onready var pause_menu = $pause_menu
@onready var fight_node = $Fight
@onready var fight_ui : CanvasLayer = $Fight/fight_ui
@onready var cutscene_node = $Cutscene

@onready var level : LevelRes = GlobalScene.next_level

@onready var fight_res : FightRes 
@onready var cutscene_res : CutsceneRes

@export var scene_transiton : SceneTransitionFade

signal fight_res_set
signal cutscene_res_set

signal game_pause
signal game_unpause

var pause_transition : bool = false
var on_victory_screen : bool = false

func _ready() -> void:
	if GlobalScene.prev_scene == GlobalScene.HOME_MENU:
		level.index = 0
	
	#print("LEVEL INDEX: ", level.index)
	GlobalSignal.connect("game_won", Callable(self, "_on_game_won"))
	GlobalSignal.connect("game_over", Callable(self, "_on_game_over"))
	GlobalSignal.connect("cutscene_over", Callable(self, "_on_cutscene_over"))
	#level.index = level.order.size() - 1 # This code is for if I want to run last in order
	next_in_order(0)

func _process(_delta : float) -> void:
	if not GlobalTime.is_paused:
		Engine.time_scale = GlobalTime.cur_time_scale

func _unhandled_input(event : InputEvent) -> void:
	if event.is_action_pressed("pause"):
		GlobalTime.photo_enabled = false
		pause_game()
		
	if event.is_action_pressed("enable_photo"):
		#print("enable photo")
		if GlobalTime.photo_enabled or GlobalTime.is_paused or on_victory_screen:
			GlobalTime.photo_enabled = false
		else:
			GlobalTime.photo_enabled = true
			
		pause_game()
# Menu Tutorial: https://youtu.be/JEQR4ALlwVU?si=3ryPHdJG3ungIi0M 

func next_in_order(increment : int) -> void:
	if increment > 0:
		for i in range(increment):
			level.next_sequence()
	
	#GlobalScene.cur_order = level.index
	if level.sequence_end:
		# Go back to main menu
		#print("sequence end")
		level.sequence_end = false
		
		#await scene_transiton.exit_anim()
		GlobalScene.load_next_scene(GlobalScene.HOME_MENU)
		
		#print("LEVEL INDEX: ", level.index)
		return
		
	if level.order[level.index] is FightRes:
		GlobalScene.cur_scene_type = GlobalScene.SceneType.FIGHT
		fight_res = level.order[level.index]
		#print("LEVEL INDEX: ", level.index)
		fight_node.show()
		cutscene_node.hide()
		
		fight_res_set.emit()
		if level.index == 0:
			await scene_transiton.enter_anim()
		return
	
	if level.order[level.index] is CutsceneRes:
		GlobalScene.cur_scene_type = GlobalScene.SceneType.CSCENE
		cutscene_res = level.order[level.index]
		cutscene_node.show()
		fight_node.hide()
		
		cutscene_res_set.emit()
		if level.index == 0:
			await scene_transiton.enter_anim()
		return
	
func pause_game() -> void:
	if pause_transition or on_victory_screen:
		## pause_transition makes it so pause input not handled 
		## when transitioning from unpaused to pause 
		return
		
	if GlobalTime.is_paused:
		#print("UNPAUSE -- is_paused: ", GlobalTime.is_paused, " transition: ", pause_transition)
		#pause_menu.hide()
		Engine.time_scale = GlobalTime.cur_time_scale
		GlobalTime.is_paused = false
		game_unpause.emit()
	else:
		#print("PAUSE -- is_paused: ", GlobalTime.is_paused, " transition: ", pause_transition)
		GlobalTime.is_paused = true
		
		pause_transition = true
		game_pause.emit()
		await GlobalTime.local_wait(0.1)
		pause_transition = false
		
		Engine.time_scale = 0
		
	#GlobalTime.is_paused = not GlobalTime.is_paused
	#print(GlobalTime.is_paused)
	
func _on_game_won() -> void:
	#print("game won on GAME end (printed from game scene script)")
	
	# Game Node doesn't use GlobalScene's on_victory_screen bool 
	# since it needs to await signal off_victory anyways
	GlobalScene.on_victory.emit()
	on_victory_screen = true
	await GlobalScene.off_victory
	on_victory_screen = false
	
	GlobalFightStats.fight_stats["total_time"] = 0.0
	GlobalFightStats.fight_stats["num_of_deaths"] = 0
	next_in_order(1)

func _on_game_over() -> void:
	GlobalFightStats.fight_stats["num_of_deaths"] += 1

func _on_cutscene_over() -> void:
	#print("pre next order cutscene: ", level.sequence_end)
	next_in_order(1)
	GlobalScene.off_victory.emit()
	#print("post next order cutscene: ", level.sequence_end)
