extends CanvasLayer

var cur_player_hp : float = 0.0
var prev_player_hp : float = 101

var damage_delay : float

func _ready() -> void:
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))
	
	
func _on_get_cur_stats(type, stats) -> void:
	match(type):
		# TODO work on making bars smooth (possibly using smoothing formula)
		# examples from base player
		# (2 * (player_res.cur_power / 100)
		# clamp(1 - ((player_res.cur_power / 100) * 0.8)
		
		"PLAYER":
			cur_player_hp = stats["cur_hp"]
			$PlayerPower.text = "POWER: " + str(stats["cur_power"])
			#$PlayerHP.text = "HP: " + str(stats["cur_hp"])
			
			$PlayerHPBar.max_value = stats["max_hp"]
			$PlayerHPBar/DamageBar.max_value = stats["max_hp"]
			
			$PlayerHPBar.value = cur_player_hp
			$PlayerHPBar/DamageBar.value = prev_player_hp
			#print("prev hp: ", prev_player_hp, " cur hp: ", cur_player_hp)
			
			if cur_player_hp < prev_player_hp:
				await GlobalTime.local_wait(5)
				print("prev hp: ", prev_player_hp, " cur hp: ", cur_player_hp)
				prev_player_hp = cur_player_hp
			
		"GUN":
			var reload_text : String = ""
			if stats["is_reloading"]:
				reload_text = " RELOADING"
				
			$GunStats.text = str(stats["cur_ammo"]) + " / " + str(stats["mag_size"]) + reload_text
