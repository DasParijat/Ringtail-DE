extends Node

const SAVE_FILE_PATH : String = "user://save_file.tres"
# NOTE: tres is readable file, res is unreadable
# use res for final launch

var save_flags : Dictionary = {
	"beat_easy": false,
	"beat_norm": false,
	"beat_hard": false,
	"beat_timed": false,
	"beat_half_hp": false,
	"beat_no_power": false,
	"beat_no_heal": false,
	"beat_fixed_cam": false,
	"three_modes": false,
	"all_modes": false
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
	# Saving settings into global save
	volumes_dict = data.volumes_dict
	visual_settings_dict = data.visual_settings_dict
	
	# Saving settings into save file itself (along with flags)
	data.flags = save_flags
	ResourceSaver.save(data, SAVE_FILE_PATH)
	print("GLOBAL SAVE: SAVED", data)

func set_flags(data : SaveDataRes) -> void:
	# Saving flags into global save
	save_flags = data.flags
	
	# Saving flags into save file itself (along with settings)
	data.volumes_dict = volumes_dict
	data.visual_settings_dict = visual_settings_dict
	ResourceSaver.save(data, SAVE_FILE_PATH)
	print("GLOBAL SAVE: SAVED", data)
	
func get_save_data() -> SaveDataRes:
	if not FileAccess.file_exists(SAVE_FILE_PATH):
		var new_data = SaveDataRes.new()
		ResourceSaver.save(new_data, SAVE_FILE_PATH)
		return new_data
	
	return ResourceLoader.load(SAVE_FILE_PATH) as SaveDataRes
