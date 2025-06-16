extends VBoxContainer

@onready var label : Label = $Label
@onready var slider : Slider = $Slider

@export var label_text : String = "Audio"
@export var bus_name : String = "Master"

var bus_index : int

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	slider.value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))
	update_text()

func update_text() -> void:
	label.text = (label_text + " - " + str(slider.value) + "%")
	
func _on_slider_value_changed(value : float) -> void:
	update_text()
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value / 75))
