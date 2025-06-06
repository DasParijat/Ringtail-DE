extends AudioStreamPlayer

var player_res : PlayerRes

@export var volume_transition_speed : float = 100.0 
@export var max_volume : float = 0.0  
@export var min_volume : float = -80.0  

func _ready() -> void:
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))

func _on_get_cur_stats(type : String, stats : Dictionary) -> void:
	if type == "PLAYER" and player_res == null:
		player_res = stats["player_res"]
		self.stream = player_res.power_audio
	
func _process(delta : float) -> void:
	var target_volume = max_volume if (GlobalPlayer.power_activated) else min_volume
	self.volume_db = lerp(self.volume_db, 
							target_volume, 
							delta * volume_transition_speed)
	print(self.volume_db)
