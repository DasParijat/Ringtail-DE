class_name BaseCutscene
extends Node2D
# Credit - jontopielski
# TODO - Change styling so it's compatible with Ringtail DE
# TODO - Set this up as a base cutscene class

const CHAR_READ_RATE = 0.05

@export var max_index : int = 4
@export var textbox_scene : Textbox
#@export var cutscene_holder : Node

@onready var textbox_container : Container = textbox_scene.textbox_container
@onready var speaker_name : Label = textbox_scene.speaker_name
@onready var dialog_text : Label = textbox_scene.dialog_text

@onready var start_symbol : Label = textbox_scene.start
@onready var end_symbol : Label = textbox_scene.end

@onready var camera_2d : Camera2D = get_parent().camera_2d # To be given in Game Scene

func _ready() -> void:
	_base_ready()
	
func _base_ready() -> void:
	## Call from extended cutscene
	GlobalScene.connect("skip_cutscene", Callable(self, "_on_skip_cutscene"))
	#enter_animation()
	
enum State {
	READY,
	READING,
	FINISHED,
	PROCESS,
	COMPLETE,
	NONE
}

var c_index : int = 0
var cutscene_manager_func : StringName = "c_index_handler"

var current_state = State.READY

var active_tweens : Array = []

var blank_name : SpeakerName = SpeakerName.new("")

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
		
		target.set(property, final_value)
		
		# Kill the tween if still running
		if tween and tween.is_running():
			tween.kill()
	active_tweens.clear()

func _process(_delta):
	match current_state:
		State.READY:
			c_index += 1
			call(cutscene_manager_func)
		State.READING:
			if (Input.is_action_just_pressed("cont_cscene") or c_index > max_index 
			and not GlobalTime.is_paused):
				skip_all_tweens()
				
				change_state(State.FINISHED)
		State.FINISHED:
			if c_index > max_index:
				change_state(State.COMPLETE)
			
			if (Input.is_action_just_pressed("cont_cscene") 
			and not GlobalTime.is_paused):
				change_state(State.PROCESS)
		State.PROCESS:
			change_state(State.READY)
			#hide_textbox()
		State.COMPLETE:
			hide_textbox()
			change_state(State.NONE)
			GlobalSignal.cutscene_over.emit()
			await exit_animation()
			self.queue_free()

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("test"):
		c_index = max_index + 1
		
func hide_textbox():
	speaker_name.text = ""
	start_symbol.text = ""
	end_symbol.text = ""
	dialog_text.text = ""
	
	if textbox_container.modulate.a > 0:
		var tween = create_tween()
		tween.tween_property(textbox_container, "modulate:a", 0, 0.2)
		await tween.finished
	textbox_container.hide()

func show_textbox():
	#start_symbol.text = "*"
	textbox_container.show()
	if textbox_container.modulate.a < 1:
		var tween = create_tween()
		tween.tween_property(textbox_container, "modulate:a", 1, 0.2)

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

func _on_tween_completed(_object, _key):
	#end_symbol.text = "v"
	change_state(State.FINISHED)

func _on_skip_cutscene() -> void:
	c_index = max_index + 1
	
func enter_animation() -> void:
	self.modulate.a = 0
	self.show()
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1, 0.5)

func exit_animation() -> void:
	self.modulate.a = 1
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0, 0.5)
		
	await tween.finished
	self.hide()
