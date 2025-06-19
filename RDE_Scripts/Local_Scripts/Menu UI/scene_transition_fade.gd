class_name SceneTransitionFade
extends ColorRect
## SceneTransitionFade is used for exit/enter anims for between loading scenes
## Always put at very bottom of scene tree

@export var transition_rate : float = 0.4

func set_enter_state() -> void:
	## Used when only exit_anim used
	self.modulate.a = 0
	hide()

func set_exit_state() -> void:
	## Used when only enter_anim used
	self.modulate.a = 1
	show()
	
func enter_anim() -> void:
	## Fade out anim, used for entering scene (use await)
	set_exit_state()
	var tween : Tween = create_tween().set_ease(Tween.EASE_IN)
	
	tween.tween_property(self, "modulate:a", 0, transition_rate)
	
	await tween.finished
	hide()

func exit_anim() -> void:
	## Fade in anim, used for exiting scene (use await)
	set_enter_state()
	var tween : Tween = create_tween().set_ease(Tween.EASE_IN)
	
	show()
	tween.tween_property(self, "modulate:a", 1, transition_rate)
	
	await tween.finished
