extends Resource
class_name MobRes
# PlayerRes is used to define the stats of each playable character

# Changable Properties
@export var name : String = "UNNAMED MOB"
@export var color : Color 
@export var hp_bg_color : Color
@export var texture : Texture2D = preload("uid://5ry8kssatn11")

@export_category("Health")
@export var health_comp : HealthRes

@export_category("Mob Specific")
@export var is_boss : bool = false
@export var is_enemy : bool = true
@export var is_hittable : bool = true # can player shoot mob or not
@export var collision_enabled : bool = false
@export var player_detection_radius : float = 150

@export_category("Sizing")
@export var pos_track_delay : float = 1.5 
@export var mob_size : Vector2 = Vector2(1, 1)
@export var sprite_size : Vector2 = Vector2(1, 1)
@export var collision_size : Vector2 = Vector2(1, 1)
@export var hitbox_size : Vector2 = Vector2(4, 4)

@export_category("Collision Damage")
@export var collision_dmg : float = 1.0
@export var collision_dmg_cooldown : float = 1.0 # in seconds
