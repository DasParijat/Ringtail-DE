class_name BaseCutscene
extends Node2D
# Credit - jontopielski
# TODO - Change styling so it's compatible with Ringtail DE
# TODO - Set this up as a base cutscene class

const CHAR_READ_RATE = 0.03

@export var start_index : int = 1
@export var end_index : int = 4
@export var textbox_scene : Textbox
#@export var cutscene_holder : Node

@onready var textbox_container : Container = textbox_scene.textbox_container
@onready var speaker_name : Label = textbox_scene.speaker_name
@onready var dialog_text : Label = textbox_scene.dialog_text

@onready var start_symbol : Label = textbox_scene.start
@onready var end_symbol : Label = textbox_scene.end

@onready var camera_2d : Camera2D = get_parent().camera_2d # To be given in Game Scene
	
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

var auto_skip : bool = false
var askip_wait_time : float = 5.0
var can_auto_skip : bool = false

var blank_name : SpeakerName = SpeakerName.new("")

func _ready() -> void:
	_base_ready()
	
func _base_ready() -> void:
	## Call from extended cutscene
	GlobalScene.connect("skip_cutscene", Callable(self, "_on_skip_cutscene"))
	camera_2d.zoom = Vector2(1, 1)
	c_index = start_index - 1
	
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
	change_state(State.READING)
	return tween

func _on_any_tween_finished(finished_tween : Tween) -> void:
	# Remove the finished tween from the array
	active_tweens = active_tweens.filter(func(info): return info["tween"] != finished_tween)
	if active_tweens.is_empty() and current_state == State.READING:
		change_state(State.FINISHED)
		start_auto_skip_timeout()
		
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
			if (Input.is_action_just_pressed("cont_cscene") or c_index > end_index 
			and not GlobalTime.is_paused):
				skip_all_tweens()
				
				change_state(State.FINISHED)
		State.FINISHED:
			if c_index > end_index:
				change_state(State.COMPLETE)
			
			if (
			(
				Input.is_action_just_pressed("cont_cscene")
				or auto_skip
			) 
			and not GlobalTime.is_paused):
				change_state(State.PROCESS)
		State.PROCESS:
			auto_skip = false
			active_tweens = []
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
		# Skip cutscene keybind
		c_index = end_index + 1
		
	if event.is_action_pressed("can_auto_skip"):
		# Enable/Disable auto_skip keybind
		can_auto_skip = not can_auto_skip
		print("Auto Skip is ", can_auto_skip)

func enable_auto_skip() -> void:
	## Used primarily for actions with no dialogue
	## So either the player can skip the action entirely
	## or watch the action scene, then have it automatically go to the next index
	auto_skip = true

func set_auto_skip_wait(new_wait : float) -> void:
	askip_wait_time = new_wait
	
func start_auto_skip_timeout() -> void:
	## After askip_wait_time seconds, cutscene automatically skips to next action
	## Difference between doing start_auto_skip_timeout(0) and just enable_auto_skip()
	##	is that this func can't happen if can_auto_skip disabled, 
	##	while enable_auto_skip happens regardless of this bool's state.
	if not can_auto_skip: return
	
	if askip_wait_time > 0: await GlobalTime.local_wait(askip_wait_time)
	await GlobalTime.is_paused == true
	if can_auto_skip: enable_auto_skip()
	
func hide_textbox():
	display_text("")
	
	if textbox_container.modulate.a > 0:
		start_tween(textbox_container, "modulate", Color(1,1,1,0), 0.2)
		await GlobalTime.local_wait(0.2)
	textbox_container.hide()

func show_textbox():
	textbox_container.show()
	if textbox_container.modulate.a < 1:
		start_tween(textbox_container, "modulate", Color(1,1,1,1), 0.2)

func display_text(text : String, speaker : SpeakerName = blank_name, read_rate : float = CHAR_READ_RATE):
	if text != "":
		# Ensures textbox is always visible when there is given text
		show_textbox()
	
	speaker_name.text = speaker.text
	speaker_name.modulate = speaker.color
	
	dialog_text.text = text
	dialog_text.visible_ratio = 0.0
	change_state(State.READING)
	
	start_tween(dialog_text, "visible_ratio", 1.0, len(text) * read_rate)

func change_state(next_state):
	current_state = next_state

func _on_tween_completed(_object, _key):
	#end_symbol.text = "v"
	change_state(State.FINISHED)

func _on_skip_cutscene() -> void:
	c_index = end_index + 1
	
func enter_animation() -> void:
	self.modulate.a = 0
	self.show()
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 1, 0.2)

func exit_animation() -> void:
	self.modulate.a = 1
	var tween = create_tween()
	tween.tween_property(self, "modulate:a", 0, 0.2)
		
	await tween.finished
	self.hide()
