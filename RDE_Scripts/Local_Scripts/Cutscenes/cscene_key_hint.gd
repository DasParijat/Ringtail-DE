class_name CSceneKeyHint
extends CanvasLayer

@onready var cont_hint : HBoxContainer = $"Container/Cont Hint"
@onready var cont_label : Label = $"Container/Cont Hint/ContLabel"

@onready var anim_player : AnimationPlayer = $"Container/Cont Hint/AnimationPlayer"

var enable_anim : bool = true

func _ready() -> void:
	cont_hint.modulate.a = 0
	if not GlobalSettings.visible_hints: hide()
		

func fade_in() -> void:
	if not GlobalSettings.visible_hints: 
		hide()
		return
	
	if cont_hint.modulate.a < 0.7 and enable_anim and visible:
		anim_player.play("fade in")

func fade_out() -> void:
	if not GlobalSettings.visible_hints: 
		hide()
		return
		
	if cont_hint.modulate.a > 0 and enable_anim:
		anim_player.play("fade out")

func _exit_tree() -> void:
	fade_out()
	await GlobalTime.local_wait(0.2)
	hide()
