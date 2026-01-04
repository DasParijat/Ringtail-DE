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
	"Master": 0,
	"Music Bus": 0,
	"Game SFX": -8.02638,
	"UI SFX": 0,
	"CScene Bus": 0
}

var visual_settings_dict : Dictionary = {
	"show_timer": false,
	"show_hints": true,
	"shake_cam": false
}

var runtime_at_completion : float = 0.0

func _ready() -> void:
	var data : SaveDataRes = get_save_data()
	save_flags = data.flags
	volumes_dict = data.volumes_dict
	visual_settings_dict = data.visual_settings_dict
	TotalRuntimeTimer.total_runtime_seconds = data.total_runtime
	runtime_at_completion = data.runtime_at_completion
	
func set_settings(data : SaveDataRes) -> void:
	# Saving settings into global save
	volumes_dict = data.volumes_dict
	visual_settings_dict = data.visual_settings_dict
	
	# Save runtime (While running, occasionally save runtime in case of crash)
	data.total_runtime = TotalRuntimeTimer.total_runtime_seconds
	data.runtime_at_completion = runtime_at_completion
	
	# Saving settings into save file itself (along with flags)
	data.flags = save_flags
	ResourceSaver.save(data, SAVE_FILE_PATH)
	print("GLOBAL SAVE: SAVED", data)

func set_flags(data : SaveDataRes) -> void:
	# Saving flags into global save
	save_flags = data.flags
	
	# Save runtime (While running, occasionally save runtime in case of crash)
	data.total_runtime = TotalRuntimeTimer.total_runtime_seconds
	
	# RAC is updated upon the player getting 100%, doesn't update afterwards
	if all_flags_true() and runtime_at_completion == 0.0:
		runtime_at_completion = TotalRuntimeTimer.total_runtime_seconds
		data.runtime_at_completion = TotalRuntimeTimer.total_runtime_seconds
	
	# Saving flags into save file itself (along with settings)
	data.volumes_dict = volumes_dict
	data.visual_settings_dict = visual_settings_dict
	ResourceSaver.save(data, SAVE_FILE_PATH)
	print("GLOBAL SAVE: SAVED", data)

func set_runtime(data : SaveDataRes = SaveDataRes.new()) -> void:
	# Fill out data with current save stats
	data.flags = save_flags
	data.volumes_dict = volumes_dict
	data.visual_settings_dict = visual_settings_dict
	
	# Update total_runtime with latest
	data.total_runtime = TotalRuntimeTimer.total_runtime_seconds
	data.runtime_at_completion = runtime_at_completion
	
	ResourceSaver.save(data, SAVE_FILE_PATH)
	print("GLOBAL SAVE: SAVED", data)
	
func get_save_data() -> SaveDataRes:
	if not FileAccess.file_exists(SAVE_FILE_PATH):
		var new_data = SaveDataRes.new()
		ResourceSaver.save(new_data, SAVE_FILE_PATH)
		return new_data
	
	return ResourceLoader.load(SAVE_FILE_PATH) as SaveDataRes

func get_completion_percentage(multiplier : float = 100) -> float:
	# Get number of true flags
	var completed : float = 0
	for flag in save_flags.values():
		if flag: completed += 1
	
	# Get percentage, and multiplier moves the decimal
	return (completed / save_flags.size()) * multiplier
	
func all_flags_true() -> bool:
	## Check if all flags are true, for 100% completion
	for flag in save_flags.values():
		if not flag:
			return false
	return true

func one_fight_beaten() -> bool:
	## If the player has beaten at least one fight
	return save_flags["beat_easy"] or save_flags["beat_norm"] or save_flags["beat_hard"]
