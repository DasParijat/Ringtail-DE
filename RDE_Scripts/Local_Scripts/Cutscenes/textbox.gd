class_name TextBox
extends CanvasLayer

@onready var textbox_container : Container = $TextboxContainer

@onready var speaker_name: Label = $TextboxContainer/MarginContainer/VBoxContainer/Name
@onready var dialog_text: Label = $TextboxContainer/MarginContainer/VBoxContainer/HBoxContainer/DialogText

@onready var start: Label = $TextboxContainer/MarginContainer/VBoxContainer/HBoxContainer/Start
@onready var end: Label = $TextboxContainer/MarginContainer/VBoxContainer/HBoxContainer/End

@onready var cont_hint : HBoxContainer = $"KeyHintContainer/Cont Hint"
@onready var cont_label : Label = $"KeyHintContainer/Cont Hint/ContLabel"

func _ready() -> void:
	set_font_size() # Reset font size

func set_font_size(new_size : int = 25):
	## Sets font size of label text
	## Default size is 25
	dialog_text.label_settings.font_size = new_size
