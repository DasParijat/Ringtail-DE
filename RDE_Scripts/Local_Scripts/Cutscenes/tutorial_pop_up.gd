class_name TutorialPopUp
extends Control

const TRANSITION_TIME = 0.3

@export var header_text : String
@export var texture : Texture
@export var desc_text : String

@onready var header : Label = $MarginContainer/Visuals/MarginContainer/VBoxContainer/Header
@onready var texture_rect : TextureRect = $MarginContainer/Visuals/MarginContainer/VBoxContainer/MarginContainer/TextureRect
@onready var desc : Label = $MarginContainer/Visuals/MarginContainer/VBoxContainer/Desc

@onready var cscene_key_hint = $cscene_key_hint

func _ready() -> void:
	header.text = header_text
	texture_rect.texture = texture
	desc.text = desc_text
	
	if not GlobalSettings.visible_hints: cscene_key_hint.hide()

func show_tutorial(rate : float = TRANSITION_TIME):
	var tween : Tween = create_tween()
	self.show()
	if self.modulate.a < 1:
		tween.tween_property(self, "modulate:a", 1, rate)

func hide_tutorial(rate : float = TRANSITION_TIME):
	var tween : Tween = create_tween()
	if self.modulate.a > 0:
		tween.tween_property(self, "modulate:a", 0, rate)
	await tween.finished
	self.hide()
