extends Node

const SAVE_FILE_PATH : String = "user://save_file.tres"
# NOTE: tres is readable file, res is unreadable
# use res for final launch

#var save_data : SaveDataRes

func set_save_data(data : SaveDataRes) -> void:
	#save_data = SaveDataRes.new()
	ResourceSaver.save(data, SAVE_FILE_PATH)
	print("GLOBAL SAVE: SAVED", data)

func get_save_data() -> SaveDataRes:
	return ResourceLoader.load(SAVE_FILE_PATH) as SaveDataRes
