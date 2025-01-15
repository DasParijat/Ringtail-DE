extends CanvasLayer

func _ready() -> void:
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))


func _on_get_cur_stats(type, stats) -> void:
	match(type):
		"PLAYER":
			$PlayerStats.text = str(stats["cur_hp"])
		"GUN":
			var reload_text : String = ""
			if stats["is_reloading"]:
				reload_text = " RELOADING"
				
			$GunStats.text = str(stats["cur_ammo"]) + " / " + str(stats["mag_size"]) + reload_text
