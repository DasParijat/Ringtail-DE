extends Resource
class_name PlayerRes

# Changable Properties
@export_category("Identifiers")
@export var p_name : String
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
@export var switch_cooldown : float 
# how long the cooldown after swithing to a new gun is

# actual gun loadout
var primary_gun : GunRes
var secondary_gun : GunRes

var cur_power_rate: float = 0.0

var cur_speed: float = base_speed
var speed_modifier: float = 1.0
var motion_modifier: float = 1.0

func set_default_loadout():
	primary_gun = def_primary_gun
	secondary_gun = def_secondary_gun
