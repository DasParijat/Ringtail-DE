extends CanvasLayer

# TODO organize each UI into their proper section
# According to the design doc

@onready var PlayerUI : Control = $PlayerUI

@onready var PlayerHPBar : ProgressBar = $PlayerUI/PlayerHPBar
@onready var DamageDelayBar : ProgressBar = $PlayerUI/PlayerHPBar/DamageBar
@onready var PlayerPowerBar : ProgressBar = $PlayerUI/PowerBar

@onready var GunInUse : TextureRect = $PlayerUI/GunUI/HBoxContainer/MarginContainer/GunInUse
@onready var GunAmmo : Label = $PlayerUI/GunUI/HBoxContainer/GunStats/GunAmmo
@onready var GunReload : Label = $PlayerUI/GunUI/HBoxContainer/GunStats/GunReload

@onready var PowerOverlay : ColorRect = $CanvasLayer/PowerOverlay


var cur_player_hp : float = 0.0
var prev_player_hp : float = 101

var player_hp_stylebox : StyleBoxFlat = StyleBoxFlat.new()
var player_power_stylebox : StyleBoxFlat = StyleBoxFlat.new()

var reload_text : String = ""
var using_power : bool = false

func _ready() -> void:
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))
	print(get_viewport().get_visible_rect().size)
	
	player_hp_stylebox.set_corner_radius_all(4)
	player_power_stylebox.set_corner_radius_all(4)

func power_overlay_handling() -> void:
	var PO_anim_player : AnimationPlayer = $CanvasLayer/PowerOverlay/AnimationPlayer

	if GlobalPlayer.power_activated:
		## For fading in anim
		using_power = true
		if PowerOverlay.modulate.a >= 0:
			PO_anim_player.play("PO_fade_IN")
			
	if GlobalPlayer.power_activated and using_power:
		## For fading out anim
		using_power = false
		if PowerOverlay.modulate.a >= 0:
			PO_anim_player.play("PO_fade_OUT")
		
func _on_get_cur_stats(type, stats) -> void:
	## Always gets current stats / Is pretty much the _process func here
	# TODO possibly seperate each UI thing into it's own function
	match(type):
		"PLAYER":
			# Power Overlay
			PowerOverlay.color = stats["player_sec_color"]
			power_overlay_handling()
			
			# Bar
			player_hp_stylebox.bg_color = stats["player_pri_color"]
			PlayerHPBar.add_theme_stylebox_override("fill", player_hp_stylebox)
			player_power_stylebox.bg_color = stats["player_sec_color"]
			player_power_stylebox.shadow_color = stats["player_sec_color"]
			player_power_stylebox.shadow_size = (2 * int(stats["cur_power"] > (stats["max_power"] / 2)))
			PlayerPowerBar.add_theme_stylebox_override("fill", player_power_stylebox)
			
			# Bar max values
			PlayerHPBar.max_value = stats["max_hp"]
			DamageDelayBar.max_value = stats["max_hp"]
			PlayerPowerBar.max_value = stats["max_power"]
			
			# Always updating
			cur_player_hp = stats["cur_hp"]
			update_bar(PlayerPowerBar, stats["cur_power"], 0.3)
			update_bar(PlayerHPBar, cur_player_hp, 0.5)
			if not stats["is_hurting"]:
				update_bar(DamageDelayBar, cur_player_hp, 3)
			
			#print("prev hp: ", prev_player_hp, " cur hp: ", cur_player_hp)
		"GUN":
			if stats["is_reloading"]:
				reload_text = "RELOADING"
				GunReload.show()
				GunAmmo.modulate = Color8(GunAmmo.modulate.r8, GunAmmo.modulate.g8, GunAmmo.modulate.b8,
										  150) # Alpha only value that matters here
			else:
				reload_text = ""
				GunReload.hide()
				GunAmmo.modulate = Color8(GunAmmo.modulate.r8, GunAmmo.modulate.g8, GunAmmo.modulate.b8, 
										  255)
				# probably an easier way to reset modulate but eh
			
			GunInUse.texture = stats["gun_image"]
			GunAmmo.text = str(stats["cur_ammo"]) + " / " + str(stats["mag_size"])
			GunReload.text = reload_text

func update_bar(bar : ProgressBar, new_hp : float, rate : float) -> void:
	bar.value = new_hp
	
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(bar, "value", new_hp, rate)
