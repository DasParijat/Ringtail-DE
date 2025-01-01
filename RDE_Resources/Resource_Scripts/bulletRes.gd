extends Resource
class_name BulletRes
# BulletRes defines the attributes of a bullet
# Bullets can be used for both player guns and boss attacks

@export_category("Qualitative Attributes")
@export var texture : Texture2D   

@export_category("Quantitative Attributes")
@export var damage : float
@export var enemy_knockback : float
@export var is_piercing : bool

@export_category("Falloff")
@export var falloff_point : float # distance until damage starts decreasing
@export var falloff_rate : float # high falloff means it deals less damage as it travels farther
