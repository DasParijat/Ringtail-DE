extends Resource
class_name GunRes

@export_category("Qualitative Attributes")
@export var name: String = "UNNAMED"  
@export var sprite: Texture2D   

@export_category("Quantitative Attributes")
@export var mag_size : int = 30
@export var fire_rate: float = 0.2       
@export var reload_time: float = 2.0 # in seconds
@export var is_automatic: bool = true             

@export_category("Bullet")
@export var bullet_res : BulletRes   
@export var num_of_bullets : int
@export var bullet_spread : float 

var ammo_capacity: int = mag_size

func shoot():
	if ammo_capacity > 0:
		ammo_capacity -= 1
		return bullet_res.damage
		
	return 0

func reload():
	#add code to wait for reload_time to complete
	ammo_capacity = mag_size 
