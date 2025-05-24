extends CanvasLayer

@onready var rest_hint : HBoxContainer = $"CenterContainer/VboxContainer/Rest Hint"
@onready var power_hint : HBoxContainer = $"CenterContainer/VboxContainer/Power Hint"
@onready var shoot_hint : HBoxContainer = $"CenterContainer/VboxContainer/Shoot Hint"
@onready var switch_hint : HBoxContainer = $"CenterContainer/VboxContainer/Switch Hint"
@onready var reload_hint : HBoxContainer = $"CenterContainer/VboxContainer/Reload Hint"

# Colors
# NOTE - The colors used primarily work with Ringtail/Oswald Fight
#		Could make it more flexible, but the scope of RDE doesn't require so
var usable_color : Color = Color(1, 0.98, 0.86, 0.9)
var in_use_color : Color = Color(1.5, 1.48, 1.26, 0.9)
var disabled_color : Color = Color(1, 0.98, 0.86, 0.4)

func _ready() -> void:
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))
	GlobalSignal.connect("game_won", Callable(self, "_on_game_won"))
	#GlobalPlayer.is_shooting

func _on_get_cur_stats(type, stats) -> void:
	## Always gets current stats 
	match(type):
		"PLAYER":
			rest_ui(stats)
			switch_ui(stats)
		"GUN":
			shoot_ui(stats)

func set_fight_ui(stats : Dictionary) -> void:
	rest_ui(stats)

func rest_ui(stats : Dictionary) -> void:
	if GlobalPlayer.is_resting: rest_hint.modulate = in_use_color
	else: rest_hint.modulate = usable_color 

func power_ui(stats : Dictionary) -> void:
	#if GlobalPlayer.is: rest_hint.modulate = in_use_color
	#else: rest_hint.modulate = usable_color 
	pass
	
func shoot_ui(stats : Dictionary) -> void:
	if stats["is_reloading"]:
		shoot_hint.modulate = disabled_color 
	else:
		shoot_hint.modulate = usable_color 
		#if GlobalPlayer.is_shooting: shoot_hint.modulate = in_use_color
		#else: shoot_hint.modulate = usable_color 
	
func switch_ui(stats : Dictionary) -> void:
	if Input.is_action_just_pressed("switch_weapon"): switch_hint.modulate = in_use_color
	else: switch_hint.modulate = usable_color 
	
func reload_ui(stats : Dictionary) -> void:
	pass
