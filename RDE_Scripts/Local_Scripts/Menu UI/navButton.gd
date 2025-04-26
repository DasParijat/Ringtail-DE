class_name navButton
extends BaseButton
# Handles buttons that can be navigated using keys (WASD/ARROW)

func _ready() -> void:
	grab_focus()

func _pressed() -> void:
	# used for dev to check if button responds
	print("PRESSED: ", $".".name)
