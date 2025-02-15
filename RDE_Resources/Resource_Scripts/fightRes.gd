extends Resource
class_name FightRes
# FightRes is used to define what's in the level

@export var FIGHT_NAME : String = "UNNAMED FIGHT"

@export var world_scene : PackedScene
@export var mob_layout_scene : PackedScene # For Ringtail DE, this may not be used at all

@export var single_boss : PackedScene
@export var single_boss_spawn : Vector2 = Vector2(0, -100) 
# Can't be (0, 0), or else bug where it spawns elsewhere occurs

@export var game_modes : Array[String]

@export var player_scene : PackedScene #= "res://RDE_Scenes/Entities/oswald.tscn"
@export var player_spawn : Vector2 = Vector2(0, 10) 
#Can't be (0, 0), or else bug where it spawns elsewhere occurs

@export var gun_array : Array[GunRes] = [] 
# If empty, player uses it's default gun array
