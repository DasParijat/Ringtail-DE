extends Resource
class_name MobRes
# PlayerRes is used to define the stats of each playable character

# Changable Properties
@export var name : String = "UNNAMED MOB"
@export var display_name : String = "NO DISPLAY NAME GIVEN" # used for health bar
@export var color : Color 
@export var hp_bg_color : Color
@export var texture : Texture2D = preload("uid://5ry8kssatn11")
@export var base_sprtflip_enabled = true

@export_category("Health")
@export var health_comp : HealthRes
@export var num_of_bars : int = 3 # For main boss hp bar

@export_category("Mob Specific")
@export var is_boss : bool = false
@export var is_enemy : bool = true
@export var is_hittable : bool = true # can player shoot mob or not
@export var collision_enabled : bool = false
@export var player_detection_radius : float = 150
@export var mini_hp_visible : bool = true

@export_category("Sizing")
@export var pos_track_delay : float = 1.5 
@export var mob_size : Vector2 = Vector2(1, 1)
@export var sprite_size : Vector2 = Vector2(1, 1)
@export var collision_size : Vector2 = Vector2(1, 1)
@export var hitbox_size : Vector2 = Vector2(4, 4)

@export_category("Collision Damage")
@export var collision_dmg : float = 1.0
@export var collision_dmg_cooldown : float = 1.0 # in seconds

var sprtflip_enabled : bool = base_sprtflip_enabled # sprtflip can be changed mid fight
