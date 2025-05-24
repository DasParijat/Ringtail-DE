extends CanvasLayer

@onready var rest_hint : HBoxContainer = $"PanelContainer/Rest Hint"
@onready var power_hint : HBoxContainer = $"PanelContainer/Power Hint"
@onready var shoot_hint : HBoxContainer = $"PanelContainer/Shoot Hint"
@onready var switch_hint : HBoxContainer = $"PanelContainer/Switch Hint"
@onready var reload_hint : HBoxContainer = $"PanelContainer/Reload Hint"

# Colors
var usable_color : Color = Color(1,1,1)
var in_use_color : Color = Color(1.5, 1.5, 1.5)
var disabled_color : Color = Color(1,1,1, 0.3)

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
