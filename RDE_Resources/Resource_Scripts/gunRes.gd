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
@export var fire_rate : float = 0.2 # in seconds
@export_enum("AUTO", "MANUAL") var reload_type : String = "AUTO"
@export var reload_time : float = 2.0 # in seconds
@export var is_automatic : bool = true             

@export_category("Bullet")
@export var bullet_res : BulletRes   
@export var bullets_per_shot : int = 1
@export var bullet_spread : float 

var cur_ammo : int
