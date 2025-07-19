class_name navButton
extends BaseButton
# Handles buttons that can be navigated using keys (WASD/ARROW)

@export var button_sound : AudioStream = preload("res://RDE_Audio/UI Sounds/Mini Crunch/enter_03.wav")

func _ready() -> void:
	grab_focus()

func _pressed() -> void:
	# used for dev to check if button responds
	print("PRESSED: ", $".".name)
	AudioManager.play_audio_one_shot(button_sound, "UI SFX")
