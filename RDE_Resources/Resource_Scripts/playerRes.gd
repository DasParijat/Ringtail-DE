extends Resource
class_name PlayerRes
# PlayerRes is used to define the stats of each playable character

# Changable Properties
@export var name : String = "UNNAMED PLAYER"
@export var primary_color : Color 
@export var secondary_color : Color 
@export var texture : Texture2D = preload("uid://c7klbsnbfmrvy")
@export var power_audio : AudioStream

@export_category("Health")
@export var health_res : HealthRes
@export var regen_rate : float = 1
@export var regen_amt : float = 2
@export var max_stored_hp : float = 5 # max limit stored hp can go
@export var stored_hp_threshold : float = 5 # when stored hp reaches this, it can be used
@export var low_hp_threshold : float = 15 # when hp gets under this value, player enters low hp mode
@export var regen_sound : AudioStream

@export_category("Speed")
@export var base_speed : float = 1000.0
@export var rest_speed : float = 100.0

@export_category("Power")
@export var max_power : float = 100.0
@export var starting_power : float = 0.0
@export var power_ex_cutoff : float = 75.0 
# If power over this, then the special ability is enhanced
@export var base_power_rate : float = 1.0

@export_category("Default Guns")
@export var def_primary_gun : GunRes
@export var def_secondary_gun : GunRes
@export var switch_cooldown : float = 0.5
# how long the cooldown after swithing to a new gun is

# actual gun loadout
# unless specified, primary and secondary gun will be the defaults
@export var gun_array : Array[GunRes] = [def_primary_gun, def_secondary_gun] 
# cur variables can dynamically change during the game

@export_category("Sizing")
@export var player_size : Vector2 = Vector2(1, 1)
@export var sprite_size : Vector2 = Vector2(1, 1)
@export var collision_size : Vector2 = Vector2(1, 1)
@export var hitbox_size : Vector2 = Vector2(1, 1)
@export var hostile_detect_size : Vector2 = Vector2(1, 1)
@export var power_near_enemy_boost : float = 0.5 # percentage

var cur_power_rate : float

var cur_power : float

var cur_speed : float 

func reset_speed():
	cur_speed = base_speed 

func reset_power_rate():
	cur_power_rate = base_power_rate

func is_under_low_hp_threshold() -> bool:
	#print("is under lht: ", health_res.cur_hp < low_hp_threshold)
	return health_res.cur_hp < low_hp_threshold
	
func get_next_gun_index(gun_index):
	#print("switch")
	if gun_index >= gun_array.size() - 1:
		gun_index = -1 #after incrementing, gun_index is back to 0
	gun_index += 1
	
	#print(gun_index)
	return(gun_index)

func handle_gun_switch(gun_index : int, timer : Timer, next_gun_switch_sound : AudioStream) -> int:
	if timer.is_stopped() and Input.is_action_just_pressed("switch_weapon"):
		gun_index = get_next_gun_index(gun_index)
		AudioManager.play_audio_one_shot(next_gun_switch_sound)
		timer.start(switch_cooldown)
		
	return(gun_index)
	
