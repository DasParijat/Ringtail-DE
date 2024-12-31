extends Resource
class_name PlayerRes
# PlayerRes is used to define the stats of each playable character

# Changable Properties
@export var name : String = "UNNAMED PLAYER"
@export var color: Color 

@export_category("Health")
@export var health_comp : HealthRes
@export var regen_rate : float = 5.0

@export_category("Speed")
@export var base_speed : float = 1000.0
@export var rest_speed : float = 100.0
@export var sprint_speed : float = 300.0

@export_category("Power")
@export var max_power : float = 100.0
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
var cur_power_rate : float
var cur_speed : float 

func reset_speed():
	cur_speed = base_speed 
	
func reset_power_rate():
	cur_power_rate = base_power_rate
