extends Resource
class_name FightRes
# FightRes is used to define what's in the level

@export var FIGHT_NAME : String = "UNNAMED FIGHT"

@export var world_scene : PackedScene
@export var mob_layout_scene : PackedScene
@export var single_boss : PackedScene

@export var game_modes : Array[String]

@export var player_scene : PackedScene #= "res://RDE_Scenes/Entities/oswald.tscn"
@export var gun_array : Array[GunRes] = [] # If empty, player uses it's default gun array
