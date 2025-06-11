class_name ModeCheck
extends PanelContainer

@onready var check_box : CheckBox = $HBoxContainer/CheckBox
@onready var desc : Label = $HBoxContainer/Desc

@export var mode_name : String = "UNANMED MODE"
@export var mode_display_name : String = "Unamed Mode" 
@export var mode_desc : String = "you need to name this mode"

func _ready() -> void:
	check_box.text = mode_display_name
	desc.text = mode_desc

func get_mode_name() -> String:
	return mode_name
