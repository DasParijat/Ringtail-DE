extends Node2D
# Fight node acts as a middle man of info between the entities it spawns, 
# and the rest of the Game scene

# Fight node will load the player and boss scenes at the start of a fight.
# it will load based on what LevelRes gives it

#@onready var level_res : LevelRes = GlobalScene.next_level.order[0]
@onready var fight_res : FightRes = GlobalScene.next_level.order[0]

@onready var player_scene : PackedScene = fight_res.player_path
@onready var boss_scene : PackedScene = load("res://RDE_Scenes/Entities/Mobs/ringtail_hard.tscn")

var player_pos : Vector2
signal player_created()

func _ready() -> void:
	print(fight_res.FIGHT_NAME)
	var player_instance = player_scene.instantiate()
	var boss_instance = boss_scene.instantiate()
	
	add_child(player_instance)
	player_created.emit()
	
	add_child(boss_instance)

func _process(delta: float) -> void:
	player_pos = get_node("Oswald").position 
	# Gets and updates position of player for outside nodes to use (such as camera)
