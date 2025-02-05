extends Control
# Helps load scenes
# Credit to JumboGameDev on YT - https://youtu.be/-renxc-EmUg?si=-hQNJ_j29HW8l4Ut

@onready var progress_label : Label = $LoadProgress

var progress : Array[float] = []
var scene_name : String
var scene_load_status 

func _ready() -> void:
	scene_name = "res://RDE_Scenes/game.tscn"
	ResourceLoader.load_threaded_request(scene_name)


func _process(delta : float) -> void:
	scene_load_status = ResourceLoader.load_threaded_get_status(scene_name, progress)
	progress_label.text = str(floor(progress[0]*100)) + "% loaded"
	if scene_load_status == ResourceLoader.THREAD_LOAD_LOADED:
		var loaded_scene = ResourceLoader.load_threaded_get(scene_name)
		get_tree().change_scene_to_packed(loaded_scene)
