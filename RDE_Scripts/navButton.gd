extends Button

func _ready() -> void:
	grab_focus()

func _pressed() -> void:
	# used for dev to check if button responds
	print("PRESSED: ", $".".name)
