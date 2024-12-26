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
@export var base_speed: float = 1000.0
@export var rest_speed: float = 100.0
@export var sprint_speed: float = 300.0

@export_category("Power")
@export var max_power: float = 100.0
@export var base_power_rate: float = 1.0

var cur_power_rate: float = 0.0

var cur_speed: float = base_speed
var speed_modifier: float = 1.0
var motion_modifier: float = 1.0
