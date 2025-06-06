extends AudioStreamPlayer

@export var volume_transition_speed : float = 100.0 
@export var max_volume : float = 0.0  
@export var min_volume : float = -80.0  

var player_res : PlayerRes
var can_play : bool = false

func _ready() -> void:
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))
	volume_db = min_volume

func _on_base_player_player_res_set() -> void:
	player_res = get_parent().player_res
	stream = player_res.power_audio
	play()
	
func _process(delta : float) -> void:
	var target_volume = max_volume if (GlobalPlayer.power_activated) else min_volume
	self.volume_db = lerp(self.volume_db, 
							target_volume, 
							delta * volume_transition_speed)
	#print(self.volume_db)
