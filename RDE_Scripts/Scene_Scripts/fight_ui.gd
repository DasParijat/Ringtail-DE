extends CanvasLayer

@onready var PlayerUI : Control = $PlayerUI

@onready var PlayerHPBar : ProgressBar = $PlayerUI/PlayerHPBar
@onready var DamageDelayBar : ProgressBar = $PlayerUI/PlayerHPBar/DamageBar
@onready var PlayerPowerBar : ProgressBar = $PlayerUI/PowerBar

@onready var GunStats : Label = $PlayerUI/GunStats
@onready var GunInUse : Sprite2D = $PlayerUI/GunInUse

var cur_player_hp : float = 0.0
var prev_player_hp : float = 101

func _ready() -> void:
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))
	print(get_viewport().get_visible_rect().size)
	
func _on_get_cur_stats(type, stats) -> void:
	match(type):
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
			
			GunInUse.texture = stats["gun_image"]
			GunStats.text = str(stats["cur_ammo"]) + " / " + str(stats["mag_size"]) + reload_text

func update_bar(bar : ProgressBar, new_hp : float, rate : float) -> void:
	bar.value = new_hp
	
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(bar, "value", new_hp, rate)
