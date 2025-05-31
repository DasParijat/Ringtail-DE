extends Resource
class_name BulletRes
# BulletRes defines the attributes of a bullet
# Bullets can be used for both player guns and boss attacks

@export_category("Qualitative Attributes")
@export var texture : Texture2D = preload("uid://dqpq6unqud4qy")
@export var gun_shot_sounds : Array[AudioStream]
@export var fade_on_exit : bool = false

@export_category("Quantitative Attributes")
@export var damage : float
@export var is_piercing : bool

@export_category("Wait Launch")
@export var wait_time : float = 0.0
@export var aim_on_wait : bool = true

@export_category("Falloff")
@export var falloff_point : float # distance until damage starts decreasing
@export var falloff_rate : float # high falloff means it deals less damage as it travels farther

@export_category("Particle Effects")
@export var enable_particle : bool = false
@export var particle_color : Color = Color.WHITE
@export var particle_texture : Texture2D
@export var particle_lifetime : float = 0.5
@export var particle_gravity : Vector2 = Vector2(-200, 0)
@export var particle_explosiveness : float = 0.0
@export var particle_amount : int = 8
@export var particle_spread : float = 45.0
