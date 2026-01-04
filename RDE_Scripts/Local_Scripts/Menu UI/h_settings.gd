class_name SettingsMenu
extends Control

signal audio_reset

@onready var show_timer : CheckButton = $MarginContainer/VBoxContainer/TabContainer/General/MarginContainer/MarginContainer/VBoxContainer/ShowTimer
@onready var show_hints : CheckButton = $MarginContainer/VBoxContainer/TabContainer/General/MarginContainer/MarginContainer/VBoxContainer/ShowHints
@onready var shake_cam : CheckButton = $MarginContainer/VBoxContainer/TabContainer/General/MarginContainer/MarginContainer/VBoxContainer/ShakeCam

@onready var reset_audio : AudioStream = preload("res://RDE_Audio/Gun Audio/PumpShotgun Audio/pump_shot1.mp3")

@onready var runtime_text : Label = $MarginContainer/VBoxContainer/TabContainer/General/MarginContainer/MarginContainer/VBoxContainer/HBoxContainer/Runtime
@onready var completion_text : Label = $MarginContainer/VBoxContainer/TabContainer/General/MarginContainer/MarginContainer/VBoxContainer/HBoxContainer/Completion


var save_data : SaveDataRes
var anim_rate : float = 0.2

func _ready() -> void:
	hide()
	modulate.a = 0
	
	load_saved_settings()
	show_timer.button_pressed = GlobalSettings.visible_timer
	show_hints.button_pressed = GlobalSettings.visible_hints
	shake_cam.button_pressed = GlobalSettings.cam_shake_enabled
	
	if GlobalSave.all_flags_true():
		completion_text.text = "100% completion at " + GlobalTime.get_time_format(GlobalSave.runtime_at_completion)
	else:
		completion_text.text = "Completion: " + str(GlobalSave.get_completion_percentage()) + "%"

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

func save_settings() -> void:
	## When user leaves settings, auto save data
	save_audio_settings()
	save_visual_settings()
	
	save_data.save_audio()
	save_data.save_visual_settings()
	
	GlobalSave.set_settings(save_data)

func _process(delta : float) -> void:
	# Always update runtime text with current runtime
	runtime_text.text = "Total Runtime: " + TotalRuntimeTimer.total_runtime_string

func load_saved_settings() -> void:
	var data : SaveDataRes = GlobalSave.get_save_data()
	
	data.load_audio()
	data.load_visual_settings()
	
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
	save_settings()
	
	GlobalMenu.emit_signal("menu_change", "MAIN")
	await exit_animation()

func set_default_volume(bus_name : String, default_volume : float) -> void:
	var bus_index : int = AudioServer.get_bus_index(bus_name)
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(default_volume))

func get_volume(bus_name : String) -> float:
	var bus_index : int = AudioServer.get_bus_index(bus_name)
	var volume : float = db_to_linear(AudioServer.get_bus_volume_db(bus_index))
	#print("get_volume, ", bus_name, ", returns ", volume)
	return volume
	
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


func _on_reset_save_pressed() -> void:
	# Reset data and reload home menu
	GlobalSave.reset_save_data()
	
	await exit_animation()
	GlobalScene.load_next_scene(GlobalScene.HOME_MENU)
