extends Resource
class_name FightRes
# FightRes is used to define what's in the level

@export var FIGHT_NAME : String = "UNNAMED FIGHT"

@export var world_path : PackedScene
@export var mob_layout_path : PackedScene

@export var player_path : PackedScene #= "res://RDE_Scenes/Entities/oswald.tscn"
@export var guns : Array = []
