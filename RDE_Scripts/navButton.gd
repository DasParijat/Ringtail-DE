extends Button

func _ready() -> void:
	grab_focus()
	_pressed()

func _pressed() -> void:
	# used for dev to check if button responds
	print("PRESSED: ", $".".name)
