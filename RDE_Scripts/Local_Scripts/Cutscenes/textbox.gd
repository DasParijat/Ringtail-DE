class_name Textbox
extends CanvasLayer

@onready var textbox_container : Container = $TextboxContainer

@onready var speaker_name: Label = $TextboxContainer/MarginContainer/VBoxContainer/Name
@onready var dialog_text: Label = $TextboxContainer/MarginContainer/VBoxContainer/HBoxContainer/DialogText

@onready var start: Label = $TextboxContainer/MarginContainer/VBoxContainer/HBoxContainer/Start
@onready var end: Label = $TextboxContainer/MarginContainer/VBoxContainer/HBoxContainer/End
