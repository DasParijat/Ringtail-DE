extends Resource
class_name MobRes
# PlayerRes is used to define the stats of each playable character

# Changable Properties
@export var name : String = "UNNAMED MOB"
@export var color : Color 
@export var texture : Texture2D = preload("res://RDE_Images/rt_ringtail1.png")
@export var is_boss : bool = false

@export_category("Health")
@export var health_comp : HealthRes
