extends VBoxContainer

@onready var label : Label = $Label
@onready var slider : Slider = $Slider

@export var label_text : String = "Audio"
@export var bus_name : String = "Master"
@export var audio_scaling : float = 1
@export var audio_step : float = 0.01

var bus_index : int

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	
	slider.step = audio_step
	
	var save_data : SaveDataRes = GlobalSave.get_save_data()
	var volume = save_data.volumes_dict[bus_name]
	slider.value = db_to_linear(volume * audio_scaling)
	
	update_text()

func update_text() -> void:
	label.text = (label_text + " - " + str(slider.value * 100) + "%")
	
func _on_slider_value_changed(value : float) -> void:
	update_text()
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value) / audio_scaling)


func _on_settings_audio_reset() -> void:
	slider.value = db_to_linear(AudioServer.get_bus_volume_db(bus_index) * audio_scaling)
	print(bus_name)
	update_text()
