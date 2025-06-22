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
	FINISHED,
	PROCESS
}

var c_index : int = 0

var current_state = State.READY
var text_queue = []
var header_queue = []

func _ready():
	#print("Starting state: State.READY")
	#hide_textbox()
	#queue_text("yo this is ringtail")
	#queue_text("ringtail what the hell")
	pass

func _process(delta):
	match current_state:
		State.READY:
			c_index += 1
			c_index_handler()
			#if !text_queue.is_empty():
			#	display_text()
		State.READING:
			if Input.is_action_just_pressed("ui_accept"):
				if dialog_text.visible_ratio == 1.0:
					change_state(State.PROCESS)
				else:
					dialog_text.visible_ratio = 1.0

					var tweens = get_tree().get_root().get_children()
					for tween in tweens:
						if tween is Tween:
							tween.kill()
					#end_symbol.text = "v"

					change_state(State.FINISHED)
		State.FINISHED:
			if Input.is_action_just_pressed("ui_accept"):
				change_state(State.PROCESS)
		State.PROCESS:
			change_state(State.READY)
			hide_textbox()

func c_index_handler() -> void:
	match c_index:
		1:
			display_text("yello1")
		2:
			display_text("yello2")
		3:
			display_text("yello3")
		4:
			display_text("yello4")
	
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

func display_text(text : String):
	var next_text = text #text_queue.pop_front()
	dialog_text.text = next_text
	dialog_text.visible_ratio = 0.0
	change_state(State.READING)
	show_textbox()

	var tween = create_tween()
	tween.tween_property(dialog_text, "visible_ratio", 1.0, len(next_text) * CHAR_READ_RATE)
	tween.finished.connect(_on_tween_completed)

func change_state(next_state):
	current_state = next_state

func _on_tween_completed(object, key):
	#end_symbol.text = "v"
	change_state(State.FINISHED)
