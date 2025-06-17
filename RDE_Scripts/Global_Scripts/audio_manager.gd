extends Node
## Took code from Skyvastern - https://youtu.be/xe5IJgggbVI?si=8hNfvhu67lULKTvD
## AudioManager mainly used for SFX sounds (such as gun shots and ui stuff)
## Basically any sound that would overlap with another

var active_music_stream: AudioStreamPlayer

@export_group("Main")
@export var audio_one_shot_scene: PackedScene
@export var clips: Node
@export var one_shots: Node

func play(audio_name: String, from_position: float = 0.0, skip_restart: bool = false) -> void:
	# Probably not gonna use Clips
	# TODO Possibly make AudioManager ONLY handle One Shots
	if skip_restart and active_music_stream and active_music_stream.name == audio_name:
		return
	
	active_music_stream = clips.get_node(audio_name)
	active_music_stream.play(from_position)


func play_audio_one_shot(audio_stream: AudioStream, bus : StringName = "Game SFX", volume_db: float = 0.0, pitch_scale : float = 0.0, from_position: float = 0.0) -> AudioOneShot:
	if is_audio_hearable(bus):
		# If volume is 0, no point in creating audio one shot
		return
		
	var audio_one_shot : AudioOneShot = audio_one_shot_scene.instantiate()
	audio_one_shot.stream = audio_stream
	audio_one_shot.volume_db = volume_db
	audio_one_shot.bus = bus
	audio_one_shot.from_position = from_position
	if pitch_scale > 0.0:
		audio_one_shot.pitch_scale = pitch_scale
		
	one_shots.add_child(audio_one_shot)
	return audio_one_shot

func is_audio_hearable(bus_name : String) -> bool:
	return db_to_linear(AudioServer.get_bus_volume_db(AudioServer.get_bus_index(bus_name))) <= 0
