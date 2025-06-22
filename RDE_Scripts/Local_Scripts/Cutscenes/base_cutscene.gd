class_name BaseCutscene
extends CanvasLayer
# Credit - jontopielski
# TODO - Change styling so it's compatible with Ringtail DE
# TODO - Set this up as a base cutscene class

const CHAR_READ_RATE = 0.05

@onready var fake_actor : Sprite2D = $FakeActor

@onready var textbox_container : Container = $TextboxContainer
@onready var speaker_name : Label = $TextboxContainer/MarginContainer/VBoxContainer/Name
@onready var dialog_text : Label = $TextboxContainer/MarginContainer/VBoxContainer/HBoxContainer/DialogText

@onready var start_symbol : Label = $TextboxContainer/MarginContainer/VBoxContainer/HBoxContainer/Start
@onready var end_symbol : Label = $TextboxContainer/MarginContainer/VBoxContainer/HBoxContainer/End

@export var max_index : int = 4

enum State {
	READY,
	READING,
	FINISHED,
	PROCESS,
	COMPLETE
}

var c_index : int = 0
var cutscene_manager_func : StringName = "c_index_handler"

var current_state = State.READY

var active_tweens : Array = []

var blank_name : SpeakerName = SpeakerName.new("")

var ringtail_name : SpeakerName = SpeakerName.new("Ringtail", Color.YELLOW_GREEN)
var oswald_name : SpeakerName = SpeakerName.new("Oswald", Color.YELLOW)

func start_tween(target : Object, property : String, final_value, duration : float) -> Tween:
	var tween : Tween = create_tween()
	tween.tween_property(target, property, final_value, duration)
	tween.finished.connect(func():
		_on_any_tween_finished(tween)
	)
	active_tweens.append({
		"tween": tween,
		"target": target,
		"property": property,
		"final_value": final_value
	})
	return tween

func _on_any_tween_finished(finished_tween : Tween) -> void:
	# Remove the finished tween from the array
	active_tweens = active_tweens.filter(func(info): return info["tween"] != finished_tween)
	if active_tweens.is_empty() and current_state == State.READING:
		change_state(State.FINISHED)
		
func skip_all_tweens():
	for tween_info in active_tweens:
		var tween = tween_info["tween"]
		var target : Object = tween_info["target"]
		var property = tween_info["property"]
		var final_value = tween_info["final_value"]
		
		# Set property to final value
		target.set(property, final_value)
		print(target.position.x)
		
		# Kill the tween if still running
		if tween and tween.is_running():
			tween.kill()
	active_tweens.clear()

func _process(delta):
	match current_state:
		State.READY:
			c_index += 1
			call(cutscene_manager_func)
		State.READING:
			if Input.is_action_just_pressed("ui_accept") or c_index > max_index:
				skip_all_tweens()
				
				change_state(State.FINISHED)
		State.FINISHED:
			if c_index > max_index:
				change_state(State.COMPLETE)
			
			if Input.is_action_just_pressed("ui_accept"):
				change_state(State.PROCESS)
		State.PROCESS:
			change_state(State.READY)
			hide_textbox()
		State.COMPLETE:
			hide_textbox()
			self.hide() # MAYBE replace with fade out anim

func c_index_handler() -> void:
	# This index handler code would not be in cutscenes extending this class
	match c_index:
		1:
			display_text("yello1")
		2:
			display_text("yello2", oswald_name)
			start_tween(fake_actor, "position", Vector2(0, 300), 1.0)
		3:
			display_text("yello3", ringtail_name)
		4:
			display_text("yello4yello4yello4yello4yello4yello4", blank_name)
		_:
			change_state(State.COMPLETE)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("test"):
		c_index = max_index + 1
		
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
	
	dialog_text.text = text
	dialog_text.visible_ratio = 0.0
	change_state(State.READING)
	show_textbox()
	
	start_tween(dialog_text, "visible_ratio", 1.0, len(text) * CHAR_READ_RATE)

func change_state(next_state):
	current_state = next_state

func _on_tween_completed(object, key):
	#end_symbol.text = "v"
	change_state(State.FINISHED)
