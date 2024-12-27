extends Resource
class_name BulletRes
# BulletRes defines the attributes of a bullet
# Bullets can be used for both player guns and boss attacks

@export_category("Qualitative Attributes")
@export var sprite: Texture2D   

@export_category("Quantitative Attributes")
@export var damage : float
@export var enemy_knockback : float
@export var is_piercing : bool

@export_category("Falloff")
@export var falloff_point : float # distance until damage starts decreasing
@export var falloff_rate : float # high falloff means it deals less damage as it travels farther

var bullet_travelled : float = 0
var spawn_loc : Vector2 # where the bullet was shot from
var cur_loc : Vector2 # where the bullet is currently

func falloff_calc():
	# checks if falloff calculation should be enabled, and to do the calc if true
	if bullet_travelled > falloff_point:
		damage -= falloff_rate

func bullet_distance_calc(delta):
	# insert code to get distance from cur_loc to spawn_loc 
	falloff_calc()
