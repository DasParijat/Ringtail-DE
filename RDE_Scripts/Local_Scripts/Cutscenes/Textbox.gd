extends CanvasLayer
# Credit - jontopielski
# TODO - Change styling so it's compatible with Ringtail DE

const CHAR_READ_RATE = 0.05

@onready var textbox_container = $TextboxContainer
@onready var start_symbol = $TextboxContainer/MarginContainer/HBoxContainer/Start
@onready var end_symbol = $TextboxContainer/MarginContainer/HBoxContainer/End
@onready var label = $TextboxContainer/MarginContainer/HBoxContainer/Label

enum State {
	READY,
	READING,
	FINISHED
}

var current_state = State.READY
var text_queue = []

func _ready():
	#print("Starting state: State.READY")
	hide_textbox()
	queue_text("yo this is ringtail")
	queue_text("ringtail what the hell")

func _process(delta):
	match current_state:
		State.READY:
			if !text_queue.is_empty():
				display_text()
		State.READING:
			if Input.is_action_just_pressed("ui_accept"):
				label.visible_ratio = 1.0

				var tweens = get_tree().get_root().get_children()
				for tween in tweens:
					if tween is Tween:
						tween.kill()
				end_symbol.text = "v"

				change_state(State.FINISHED)
		State.FINISHED:
			if Input.is_action_just_pressed("ui_accept"):
				change_state(State.READY)
				hide_textbox()

func queue_text(next_text):
	text_queue.push_back(next_text)

func hide_textbox():
	start_symbol.text = ""
	end_symbol.text = ""
	label.text = ""
	textbox_container.hide()

func show_textbox():
	start_symbol.text = "*"
	textbox_container.show()

func display_text():
	var next_text = text_queue.pop_front()
	label.text = next_text
	label.visible_ratio = 0.0
	change_state(State.READING)
	show_textbox()

	var tween = create_tween()
	tween.tween_property(label, "visible_ratio", 1.0, len(next_text) * CHAR_READ_RATE)
	tween.finished.connect(_on_tween_completed)

func change_state(next_state):
	current_state = next_state
	match current_state:
		State.READY:
			#print("Changing state to: State.READY")
			pass
		State.READING:
			#print("Changing state to: State.READING")
			pass
		State.FINISHED:
			#print("Changing state to: State.FINISHED")
			pass

func _on_tween_completed(object, key):
	end_symbol.text = "v"
	change_state(State.FINISHED)
