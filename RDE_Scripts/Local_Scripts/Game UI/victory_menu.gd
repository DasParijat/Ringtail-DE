extends CanvasLayer

func _ready() -> void:
	hide()
	GlobalScene.connect("on_victory", Callable(self, "_on_victory"))

func _on_victory() -> void:
	show()
	
func _on_continue_pressed() -> void:
	GlobalScene.off_victory.emit()
	hide()
