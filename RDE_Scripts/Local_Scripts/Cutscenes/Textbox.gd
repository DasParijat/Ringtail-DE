extends CanvasLayer
# Credit - jontopielski
# TODO - Change styling so it's compatible with Ringtail DE

const CHAR_READ_RATE = 0.05

@export var textbox_container : Container
@export var speaker_name : Label
@export var dialog_text : Label

@export var start_symbol : Label
@export var end_symbol : Label

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
				dialog_text.visible_ratio = 1.0

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
	dialog_text.text = ""
	textbox_container.hide()

func show_textbox():
	start_symbol.text = "*"
	textbox_container.show()

func display_text():
	var next_text = text_queue.pop_front()
	dialog_text.text = next_text
	dialog_text.visible_ratio = 0.0
	change_state(State.READING)
	show_textbox()

	var tween = create_tween()
	tween.tween_property(dialog_text, "visible_ratio", 1.0, len(next_text) * CHAR_READ_RATE)
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
