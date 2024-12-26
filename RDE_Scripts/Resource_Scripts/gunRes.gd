extends Resource
class_name GunRes

@export_category("Qualitative Attributes")
@export var name: String = "UNNAMED"  
@export var sprite: Texture2D   

@export_category("Quantitative Attributes")
@export var mag_size : int = 30
@export var damage: float = 10.0         
@export var fire_rate: float = 0.2       
@export var reload_time: float = 2.0 # in seconds
@export var is_automatic: bool = true             

var ammo_capacity: int = mag_size

func shoot():
	if ammo_capacity > 0:
		ammo_capacity -= 1
		return damage
		
	return 0

func reload():
	ammo_capacity = mag_size 
