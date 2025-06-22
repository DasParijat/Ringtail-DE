class_name Cutscene
extends CanvasLayer
# Credit - jontopielski
# TODO - Change styling so it's compatible with Ringtail DE
# TODO - Set this up as a base cutscene class

const CHAR_READ_RATE = 0.05

@onready var fake_actor : Sprite2D = $FakeActor

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
var can_proceed : bool = false

var current_state = State.READY
var text_queue = []
var header_queue = []

var active_tweens : Array = []
var text_tween : Tween = null
var actor_tween : Tween = null

var blank_name : SpeakerName = SpeakerName.new("")

var ringtail_name : SpeakerName = SpeakerName.new("Ringtail", Color.YELLOW_GREEN)
var oswald_name : SpeakerName = SpeakerName.new("Oswald", Color.YELLOW)

func _ready():
	#print("Starting state: State.READY")
	#hide_textbox()
	#queue_text("yo this is ringtail")
	#queue_text("ringtail what the hell")
	pass

func start_tween(target : Object, property : String, final_value, duration : float) -> Tween:
	var tween : Tween = create_tween()
	tween.tween_property(target, property, final_value, duration)
	active_tweens.append({
		"tween": tween,
		"target": target,
		"property": property,
		"final_value": final_value
	})
	return tween

func skip_all_tweens():
	for tween_info in active_tweens:
		var tween = tween_info["tween"]
		var target = tween_info["target"]
		var property = tween_info["property"]
		var final_value = tween_info["final_value"]
		# Set property to final value
		target.set(property, final_value)
		# Kill the tween if still running
		if tween and tween.is_running():
			tween.kill()
	active_tweens.clear()

func _process(delta):
	match current_state:
		State.READY:
			can_proceed = true
			c_index += 1
			c_index_handler()
			#if !text_queue.is_empty():
			#	display_text()
		State.READING:
			#if dialog_text.visible_ratio == 1.0
			if Input.is_action_just_pressed("ui_accept"):
				#if dialog_text.visible_ratio == 1.0:
				#	change_state(State.PROCESS)
				#else:
				skip_all_tweens()
				
				#if text_tween and text_tween.is_running():
				#	text_tween.kill()
				#dialog_text.visible_ratio = 1.0

				# Skip actor tween
				#if actor_tween and actor_tween.is_running():
				#	actor_tween.kill()
				
				#dialog_text.visible_ratio = 1.0

				#var tweens = get_tree().get_root().get_children()
				#for tween in tweens:
				#	if tween is Tween:
				#		tween.kill()
					#end_symbol.text = "v"

				change_state(State.FINISHED)
		State.FINISHED:
			if Input.is_action_just_pressed("ui_accept"):
				change_state(State.PROCESS)
		State.PROCESS:
			change_state(State.READY)
			hide_textbox()

func c_index_handler() -> void:
	# This index handler code would not be in cutscenes extending this class
	actor_tween = create_tween()
	match c_index:
		1:
			display_text("yello1")
		2:
			display_text("yello2", oswald_name)
			start_tween(fake_actor, "position:x", 300, 1.0)
			#actor_tween.tween_property(fake_actor, "position:x", 300, 1)
		3:
			display_text("yello3", ringtail_name)
		4:
			display_text("yello4yello4yello4yello4yello4yello4", blank_name)
	
func queue_text(next_text):
	text_queue.push_back(next_text)

func hide_textbox():
	start_symbol.text = ""
	end_symbol.text = ""
	dialog_text.text = ""
	textbox_container.hide()

func show_textbox():
	#start_symbol.text = "*"
	textbox_container.show()

func display_text(text : String, speaker : SpeakerName = blank_name):
	speaker_name.text = speaker.text
	speaker_name.modulate = speaker.color
	#var next_text = text #text_queue.pop_front()
	
	dialog_text.text = text
	dialog_text.visible_ratio = 0.0
	change_state(State.READING)
	show_textbox()
	
	start_tween(dialog_text, "visible_ratio", 1.0, len(text) * CHAR_READ_RATE)
	#text_tween = create_tween()
	#text_tween.tween_property(dialog_text, "visible_ratio", 1.0, len(text) * CHAR_READ_RATE)
	#text_tween.finished.connect(_on_tween_completed)

func change_state(next_state):
	current_state = next_state

func _on_tween_completed(object, key):
	#end_symbol.text = "v"
	change_state(State.FINISHED)
