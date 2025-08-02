extends Resource
class_name SaveDataRes

@export var true_mode_locked : bool = true

@export var volumes_dict : Dictionary = {
	"Master": 1,
	"Music Bus": 1,
	"Game SFX": 0.4,
	"UI SFX": 1,
	"CScene Bus": 1
}
@export var visual_settings_dict : Dictionary = {
	"show_timer": false,
	"show_hints": true,
	"shake_cam": false
}

var bus_name_array : Array[String] = [
		"Master", 
		"Music Bus", 
		"Game SFX", 
		"UI SFX", 
		"CScene Bus"
]
	
func set_default_volume(bus_name : String, default_volume : float) -> void:
	var bus_index : int = AudioServer.get_bus_index(bus_name)
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(default_volume))

func set_audio(master_vol : float = 1, music_vol : float = 1, game_vol : float = 0.4, ui_vol : float = 1, cscene_vol : float = 1) -> void:
	set_default_volume("Master", master_vol)
	set_default_volume("Music Bus", music_vol)
	set_default_volume("Game SFX", game_vol)
	set_default_volume("UI SFX", ui_vol)
	set_default_volume("CScene Bus", cscene_vol)

func mute_audio() -> void:
	for bus in bus_name_array:
		set_default_volume(bus, 0)

func save_audio() -> void:
	for bus_name in bus_name_array:
		var index = AudioServer.get_bus_index(bus_name)
		volumes_dict[bus_name] = AudioServer.get_bus_volume_db(index)
	
func load_audio() -> void:
	set_audio(
		volumes_dict["Master"],
		volumes_dict["Music Bus"],
		volumes_dict["Game SFX"],
		volumes_dict["UI SFX"],
		volumes_dict["CScene Bus"]
	)

func save_visual_settings() -> void:
	pass
	
func load_visual_settings() -> void:
	pass
