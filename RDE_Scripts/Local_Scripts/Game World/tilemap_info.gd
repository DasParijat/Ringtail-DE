extends Node2D

@export var audio_player : AudioStreamPlayer

@export var cam_border_x : float = 1700
@export var cam_border_y : float = 1200

@export var base_canvas_mod : Color = Color(255, 255, 255, 255)
# RGT Plains canvas mod hex - f8bfa5

@export var volume_transition_speed : float = 2.0 
@export var max_volume : float = -17.0  
@export var min_volume : float = -80.0  

func _ready() -> void:
	GlobalScene.cam_border_x = cam_border_x
	GlobalScene.cam_border_y = cam_border_y
	
func _process(delta : float) -> void:
	if audio_player == null:
		return
	
	var target_volume = max_volume if GlobalPlayer.is_moving and !GlobalTime.is_paused else min_volume
	audio_player.volume_db = lerp(audio_player.volume_db, 
									target_volume, 
									delta * volume_transition_speed)
