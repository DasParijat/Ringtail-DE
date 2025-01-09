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
			# TODO make text in it's own string (that way it shows both ammo and reloading)
			# important so player can see manual reload in action
			
			if stats["is_reloading"]:
				$GunStats.text = "RELOADING"
			else:
				$GunStats.text = str(stats["cur_ammo"]) + " / " + str(stats["mag_size"])
