extends CanvasLayer
# Helps load scenes
# Credit to JumboGameDev on YT - https://youtu.be/-renxc-EmUg?si=-hQNJ_j29HW8l4Ut

@export var progress_label : Label
@export var load_progress_bar : ProgressBar

@export var scene_transition : SceneTransitionFade
@onready var background : TextureRect = $Background

var progress : Array[float] = []
var scene_load_status : int
var secret_screen_chance : int = 5

var scene_name : String = GlobalScene.HOME_MENU
# if not working, scene loads to main menu

func _ready() -> void:
	Engine.time_scale = 1 # Ensures time scale is normal when loading next scene
	
	# Starts at 12.5% chance of secret screen
	if GlobalSave.save_flags["beat_hard"]:
		# 25% chance of secret screen
		secret_screen_chance = 3
	if GlobalSave.all_flags_true():
		# 50% chance of secret screen
		secret_screen_chance = 1
		
	if (randi_range(0, secret_screen_chance) == 0):
		background.texture = preload("res://RDE_Images/loading_secret_screen_image1.png")
	
	await scene_transition.enter_anim()
	
	if GlobalScene.next_scene:
		scene_name = GlobalScene.next_scene
	
	ResourceLoader.load_threaded_request(scene_name)


func _process(_delta : float) -> void:
	scene_load_status = ResourceLoader.load_threaded_get_status(scene_name, progress)
	
	progress_label.text = str(floor(progress[0]*100)) + "% loaded"
	load_progress_bar.value = floor(progress[0]*100)
	
	if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
		var loaded_scene = ResourceLoader.load_threaded_get(scene_name)
		
		await GlobalTime.local_wait(0.2) # artificially extending load time
		await scene_transition.exit_anim()
		scene_transition.set_exit_state()
		
		get_tree().change_scene_to_packed(loaded_scene)
