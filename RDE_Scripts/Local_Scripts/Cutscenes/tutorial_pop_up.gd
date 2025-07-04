extends Control

@export var header_text : String
@export var texture : Texture
@export var desc_text : String

@onready var header : Label = $MarginContainer/Visuals/MarginContainer/VBoxContainer/Header
@onready var texture_rect : TextureRect = $MarginContainer/Visuals/MarginContainer/VBoxContainer/MarginContainer/TextureRect
@onready var desc : Label = $MarginContainer/Visuals/MarginContainer/VBoxContainer/Desc

func _ready() -> void:
	header.text = header_text
	texture_rect.texture = texture
	desc.text = desc_text
