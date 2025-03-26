extends Resource
class_name GunRes
# GunRes used to define
# specific guns a player can use

@export_category("Qualitative Attributes")
@export var name : String = "UNNAMED"  
@export var texture : Texture2D   

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
@export var bullets_per_shot_spread : float = 0
@export var max_spread : float = 0
@export var spread_rate : float = 0.1 # lower the rate the slower it takes to reach max_spread

@export_category("Camera Effect") 
@export var shake_strength : float = 0.5 # how far out it shakes to
@export var shake_fade : float = 0.5 # how long it shakes

var cur_ammo : int
