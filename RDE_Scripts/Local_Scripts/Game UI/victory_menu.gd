extends CanvasLayer

@onready var parent_container: Container = $HSplitContainer

func _ready() -> void:
	hide()
	GlobalScene.connect("on_victory", Callable(self, "_on_victory"))

func _on_victory() -> void:
	var tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	
	tween.tween_property(parent_container, "modulate", Color(1,1,1,1), GlobalScene.victory_fade_rate)
	await tween.finished
	show()
	
func _on_continue_pressed() -> void:
	GlobalScene.off_victory.emit()
	var tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	
	tween.tween_property(parent_container, "modulate", Color(1,1,1,0), GlobalScene.victory_fade_rate)
	await tween.finished
	hide()
