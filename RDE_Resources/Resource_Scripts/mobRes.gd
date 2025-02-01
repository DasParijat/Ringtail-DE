extends Resource
class_name MobRes
# PlayerRes is used to define the stats of each playable character

# Changable Properties
@export var name : String = "UNNAMED MOB"
@export var color : Color 
@export var texture : Texture2D = preload("res://RDE_Images/rt_ringtail1.png")

@export_category("Health")
@export var health_comp : HealthRes

@export_category("Mob Specific")
@export var is_boss : bool = false
@export var is_hittable : bool = true # can player shoot mob or not
@export var pos_track_delay : float = 1.5 
@export var collision_size : int # replace type with whatever determines shape size
@export var collision_dmg : float = 1.0
