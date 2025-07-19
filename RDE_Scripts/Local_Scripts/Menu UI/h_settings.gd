class_name SettingsMenu
extends Control

signal audio_reset

@onready var show_timer : CheckButton = $MarginContainer/VBoxContainer/TabContainer/Visuals/MarginContainer/MarginContainer/VBoxContainer/ShowTimer
@onready var show_hints : CheckButton = $MarginContainer/VBoxContainer/TabContainer/Visuals/MarginContainer/MarginContainer/VBoxContainer/ShowHints
@onready var shake_cam : CheckButton = $MarginContainer/VBoxContainer/TabContainer/Visuals/MarginContainer/MarginContainer/VBoxContainer/ShakeCam

@onready var reset_audio : AudioStream = preload("res://RDE_Audio/Gun Audio/PumpShotgun Audio/pump_shot1.mp3")

var anim_rate : float = 0.2

func _ready() -> void:
	hide()
	modulate.a = 0
	
	show_timer.button_pressed = GlobalSettings.visible_timer
	show_hints.button_pressed = GlobalSettings.visible_hints
	shake_cam.button_pressed = GlobalSettings.cam_shake_enabled

func enter_animation() -> void:
	show()
	var tween = create_tween()
	tween.set_parallel(true)
	
	tween.tween_property(self, "modulate:a", 1, anim_rate)

func exit_animation() -> void:
	var tween = create_tween()
	tween.set_parallel(true)
	
	tween.tween_property(self, "modulate:a", 0, anim_rate)
	await tween.finished
	hide()

func save_visual_settings() -> void:
	## When user leaves settings, update values they changed in Visual Tab
	GlobalSettings.visible_timer = show_timer.button_pressed
	GlobalSettings.visible_hints = show_hints.button_pressed
	GlobalSettings.cam_shake_enabled = shake_cam.button_pressed
	
func _on_settings_back_b_pressed() -> void:
	save_visual_settings()
	
	GlobalMenu.emit_signal("menu_change", "MAIN")
	await exit_animation()

func set_default_volume(bus_name : String, default_volume : float) -> void:
	var bus_index : int = AudioServer.get_bus_index(bus_name)
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(default_volume))

func _on_reset_audio_b_pressed() -> void:
	set_default_volume("Master", 1)
	set_default_volume("Music Bus", 1)
	set_default_volume("Game SFX", 0.5)
	set_default_volume("UI SFX", 1)
	set_default_volume("CScene Bus", 1)
	
	AudioManager.play_audio_one_shot(reset_audio, "Game SFX")
	audio_reset.emit()

func _on_mute_b_pressed() -> void:
	var bus_array : Array[String] = [
		"Master", 
		"Music Bus", 
		"Game SFX", 
		"UI SFX", 
		"CScene Bus"
		]
	
	for bus in bus_array:
		set_default_volume(bus, 0)
	
	audio_reset.emit()
