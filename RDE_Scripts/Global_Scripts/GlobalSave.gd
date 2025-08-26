extends Node

const SAVE_FILE_PATH : String = "user://save_file.tres"
# NOTE: tres is readable file, res is unreadable
# use res for final launch

var save_flags : Dictionary = {
	"true_mode_locked": true
}

var volumes_dict : Dictionary = {
	"Master": 1,
	"Music Bus": 1,
	"Game SFX": 0.4,
	"UI SFX": 1,
	"CScene Bus": 1
}

var visual_settings_dict : Dictionary = {
	"show_timer": false,
	"show_hints": true,
	"shake_cam": false
}

func _ready() -> void:
	var data : SaveDataRes = get_save_data()
	save_flags = data.flags
	volumes_dict = data.volumes_dict
	visual_settings_dict = data.visual_settings_dict
	
func set_settings(data : SaveDataRes) -> void:
	data.flags = save_flags
	ResourceSaver.save(data, SAVE_FILE_PATH)
	print("GLOBAL SAVE: SAVED", data)

func set_flags(data : SaveDataRes) -> void:
	data.volumes_dict = volumes_dict
	data.visual_settings_dict = visual_settings_dict
	ResourceSaver.save(data, SAVE_FILE_PATH)
	print("GLOBAL SAVE: SAVED", data)

func get_save_data() -> SaveDataRes:
	return ResourceLoader.load(SAVE_FILE_PATH) as SaveDataRes
