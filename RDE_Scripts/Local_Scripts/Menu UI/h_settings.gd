class_name SettingsMenu
extends Control

var anim_rate : float = 0.2

func _ready() -> void:
	hide()
	modulate.a = 0

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


func _on_settings_back_b_pressed() -> void:
	GlobalMenu.emit_signal("menu_change", "MAIN")
	await exit_animation()
