extends Control

func _ready() -> void:
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))

func _process(delta: float) -> void:
	pass

func _on_get_cur_stats(type, stats) -> void:
	match(type):
		"PLAYER":
			$PlayerStats.text = str(stats["cur_hp"])
		"GUN":
			$GunStats.text = str(stats["gun_type"])
