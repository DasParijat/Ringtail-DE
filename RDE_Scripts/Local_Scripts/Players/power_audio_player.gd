extends AudioStreamPlayer

@export var bus_name : String = "Game SFX"

@export var volume_transition_speed : float = 1.0
@export var max_volume : float = 0.0  
@export var min_volume : float = -80.0  

var player_res : PlayerRes
var can_play : bool = false

func _ready() -> void:
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))
	var bus_index = AudioServer.get_bus_index(bus_name)
	max_volume += AudioServer.get_bus_volume_db(bus_index)

	volume_db = min_volume

func _on_base_player_player_res_set() -> void:
	player_res = get_parent().player_res
	stream = player_res.power_audio
	play()
	
func _process(delta : float) -> void:
	var target_volume = max_volume if (GlobalPlayer.power_activated) else min_volume
	self.volume_db = lerpf(self.volume_db, 
							target_volume, 
							volume_transition_speed)
	#print(self.volume_db, target_volume)
