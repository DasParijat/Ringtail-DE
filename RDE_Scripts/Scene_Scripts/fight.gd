extends Node2D

# Fight node will load the player and boss scenes at the start of a fight.
# it will load based on what LevelRes gives it
@onready var player_scene : PackedScene = preload("res://RDE_Scenes/Entities/oswald.tscn")
@onready var boss_scene : PackedScene = preload("res://RDE_Scenes/Entities/Mobs/ringtail_hard.tscn")

func _ready() -> void:
	var player_instance = player_scene.instantiate()
	var boss_instance = boss_scene.instantiate()
	
	add_child(player_instance)
	add_child(boss_instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
