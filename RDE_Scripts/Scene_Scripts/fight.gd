extends Node2D
# Fight node acts as a middle man of info between the entities it spawns, 
# and the rest of the Game scene

# Fight node will load the player and boss scenes at the start of a fight.
# it will load based on what FightRes gives it

var boss_scene : PackedScene 

var fight_res : FightRes
var player_scene : PackedScene

var player_pos : Vector2
signal player_created()

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if find_child("Oswald"):
		player_pos = get_node("Oswald").position 
	# Gets and updates position of player for outside nodes to use (such as camera)

func create_fight() -> void:
	print(fight_res.FIGHT_NAME)
	var player_instance = player_scene.instantiate()
	var boss_instance = boss_scene.instantiate()
	
	add_child(player_instance)
	player_created.emit()
	
	add_child(boss_instance)

func clear_fight() -> void:
	# Insert code to clear all child nodes
	pass

func _on_game_fight_res_set() -> void:
	fight_res = get_parent().fight_res
	
	# Getting player
	player_scene = fight_res.player_path
	
	# Getting Boss / Mobs
	if fight_res.single_boss:
		boss_scene = fight_res.single_boss 
		
	if fight_res.mob_layout_path:
		# Insert code to handle adding mob layout to fight
		# May not work on mob layout for a while since 
		# not needed for Ringtail specifically
		pass
	
	create_fight()
