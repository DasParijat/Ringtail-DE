extends Resource
class_name GunRes
# GunRes used to define
# specific guns a player can use

@export_category("Qualitative Attributes")
@export var name: String = "UNNAMED"  
@export var sprite: Texture2D   

@export_category("Quantitative Attributes")
@export var bullet_speed : int = 750
@export var mag_size : int = 30
@export var fire_rate : float = 0.2       
@export_enum("AUTO", "MANUAL") var reload_type : String = "AUTO"
@export var reload_time : float = 2.0 # in seconds
@export var is_automatic : bool = true             

@export_category("Bullet")
@export var bullet_res : BulletRes   
@export var num_of_bullets : int
@export var bullet_spread : float 

var cur_ammo: int = mag_size

func shoot():
	if cur_ammo > 0:
		cur_ammo -= 1
		return bullet_res.damage
		
	return 0

	
func reload():
	match(reload_type):
		"AUTO":
			auto_reload()
		"MANUAL":
			var manual_reload_time = reload_time / mag_size
			manual_reload(manual_reload_time)
			
func auto_reload():
	#add code to wait for (reload_time) until completely reloaded
	cur_ammo = mag_size 

func manual_reload(manual_reload_time):
	while cur_ammo < mag_size:
		cur_ammo += 1
		# add code to wait (manual_reload_time) between each bullet loaded
