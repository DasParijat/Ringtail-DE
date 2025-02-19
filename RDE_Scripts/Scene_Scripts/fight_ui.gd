extends CanvasLayer

@onready var PlayerUI : Control = $PlayerUI

@onready var PlayerHPBar : ProgressBar = $PlayerUI/PlayerHPBar
@onready var DamageDelayBar : ProgressBar = $PlayerUI/PlayerHPBar/DamageBar
@onready var PlayerPowerBar : ProgressBar = $PlayerUI/PowerBar

var cur_player_hp : float = 0.0
var prev_player_hp : float = 101

func _ready() -> void:
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))
	print(get_viewport().get_visible_rect().size)
	# TODO Work on making viewport and UI more flexible
	
	PlayerUI.anchor_left = 0
	PlayerUI.anchor_top = 1
	PlayerUI.anchor_right = 0
	PlayerUI.anchor_bottom = 1
	
	PlayerUI.offset_left = 20
	PlayerUI.offset_top = -120  
	PlayerUI.offset_right = 220  
	PlayerUI.offset_bottom = -20  
	
	
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
			
			
			PlayerHPBar.max_value = stats["max_hp"]
			DamageDelayBar.max_value = stats["max_hp"]
			PlayerPowerBar.max_value = stats["max_power"]
			
			update_bar(PlayerPowerBar, stats["cur_power"], 0.3)
			update_bar(PlayerHPBar, cur_player_hp, 0.5)
			if not stats["is_hurting"]:
				update_bar(DamageDelayBar, cur_player_hp, 3)
			
			#print("prev hp: ", prev_player_hp, " cur hp: ", cur_player_hp)
		"GUN":
			var reload_text : String = ""
			if stats["is_reloading"]:
				reload_text = " RELOADING"
				
			$GunStats.text = str(stats["cur_ammo"]) + " / " + str(stats["mag_size"]) + reload_text

func update_bar(bar : ProgressBar, new_hp : float, rate : float) -> void:
	bar.value = new_hp
	
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(bar, "value", new_hp, rate)
