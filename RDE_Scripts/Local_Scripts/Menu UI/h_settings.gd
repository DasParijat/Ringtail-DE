class_name SettingsMenu
extends Control

signal audio_reset

@onready var show_timer : CheckButton = $MarginContainer/VBoxContainer/TabContainer/Visuals/MarginContainer/MarginContainer/VBoxContainer/ShowTimer
@onready var show_hints : CheckButton = $MarginContainer/VBoxContainer/TabContainer/Visuals/MarginContainer/MarginContainer/VBoxContainer/ShowHints
@onready var shake_cam : CheckButton = $MarginContainer/VBoxContainer/TabContainer/Visuals/MarginContainer/MarginContainer/VBoxContainer/ShakeCam

@onready var reset_audio : AudioStream = preload("res://RDE_Audio/Gun Audio/PumpShotgun Audio/pump_shot1.mp3")

var save_data : SaveDataRes
var anim_rate : float = 0.2

func _ready() -> void:
	hide()
	modulate.a = 0
	
	_load_save()
	show_timer.button_pressed = GlobalSettings.visible_timer
	show_hints.button_pressed = GlobalSettings.visible_hints
	shake_cam.button_pressed = GlobalSettings.cam_shake_enabled

func enter_animation() -> void:
	show()
	var tween = create_tween()
	tween.set_parallel(true)
	save_data = SaveDataRes.new()
	
	tween.tween_property(self, "modulate:a", 1, anim_rate)

func exit_animation() -> void:
	var tween = create_tween()
	tween.set_parallel(true)
	
	tween.tween_property(self, "modulate:a", 0, anim_rate)
	await tween.finished
	hide()

func _save_data() -> void:
	## When user leaves settings, auto save data
	save_data.set_audio()
	save_visual_settings()
	
	save_data.save_audio()
	save_data.save_visual_settings()
	#save_data.true_mode_locked =
	
	ResourceSaver.save(save_data, "user://save_file.tres")
	print("SETTINGS MENU: SAVED", save_data)
	# NOTE: tres is readable file, res is unreadable
	# use res for final launch

func _load_save() -> void:
	var data : SaveDataRes = ResourceLoader.load("user://save_file.tres") as SaveDataRes
	
	data.load_audio()
	data.load_visual_settings()
	print("SETTINGS MENU: LOADED", data)
	
func save_visual_settings() -> void:
	## Update values they changed in Visual Tab
	GlobalSettings.visible_timer = show_timer.button_pressed
	GlobalSettings.visible_hints = show_hints.button_pressed
	GlobalSettings.cam_shake_enabled = shake_cam.button_pressed

func save_audio_settings() -> void:
	save_data.set_audio(
		get_volume("Master"),
		get_volume("Music Bus"),
		get_volume("Game SFX"),
		get_volume("UI SFX"),
		get_volume("CScene Bus")
	)
func _on_settings_back_b_pressed() -> void:
	_save_data()
	
	GlobalMenu.emit_signal("menu_change", "MAIN")
	await exit_animation()

func set_default_volume(bus_name : String, default_volume : float) -> void:
	var bus_index : int = AudioServer.get_bus_index(bus_name)
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(default_volume))

func get_volume(bus_name : String) -> float:
	var bus_index : int = AudioServer.get_bus_index(bus_name)
	return AudioServer.get_bus_volume_db(bus_index)
	
func _on_reset_audio_b_pressed() -> void:
	set_default_volume("Master", 1)
	set_default_volume("Music Bus", 1)
	set_default_volume("Game SFX", 0.3)
	set_default_volume("UI SFX", 1)
	set_default_volume("CScene Bus", 1)
	
	AudioManager.play_audio_one_shot(reset_audio, "Game SFX")
	save_data.set_audio()
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
	
	save_data.mute_audio()
	audio_reset.emit()
