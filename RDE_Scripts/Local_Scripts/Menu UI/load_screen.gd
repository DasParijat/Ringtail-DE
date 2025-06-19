extends CanvasLayer
# Helps load scenes
# Credit to JumboGameDev on YT - https://youtu.be/-renxc-EmUg?si=-hQNJ_j29HW8l4Ut

@onready var progress_label : Label = $LoadProgress
@onready var load_progress_bar : ProgressBar = $LoadProgressBar

@export var scene_transition : SceneTransitionFade

var progress : Array[float] = []
var scene_load_status : int

var scene_name : String = GlobalScene.HOME_MENU
# if not working, scene loads to main menu

func _ready() -> void:
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
		#await GlobalTime.local_wait(0.5) # artificially extending load time
		await scene_transition.exit_anim()
		get_tree().change_scene_to_packed(loaded_scene)
