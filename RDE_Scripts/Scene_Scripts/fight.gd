extends Node2D
# Fight node acts as a middle man of info between the entities it spawns, 
# and the rest of the Game scene

# Fight node will load the player and boss scenes at the start of a fight.
# it will load based on what FightRes gives it

@onready var fight_time_tracker = $FightTimeTracker

var fight_res : FightRes
var player_scene : PackedScene
var boss_scene : PackedScene 

var boss_name = "NO BOSS NAME"

var player_name = "NO PLAYER NAME"
var player_pos : Vector2
signal player_created()

func _on_game_fight_res_set() -> void:
	fight_res = get_parent().fight_res
	
	# Getting player
	player_scene = fight_res.player_scene
	
	# Getting Boss / Mobs
	if fight_res.single_boss:
		boss_scene = fight_res.single_boss 
		
	if fight_res.mob_layout_scene:
		# Insert code to handle adding mob layout to fight
		# May not work on mob layout for a while since 
		# not needed for Ringtail specifically
		pass
	
	create_fight()
	
func _process(delta: float) -> void:
	if has_node(player_name):
		player_pos = get_node(player_name).position 
	# Gets and updates position of player for outside nodes to use (such as camera)
	
	# For testing
	if Input.is_action_just_pressed("test"):
		#clear_fight()
		pass

func create_fight() -> void:
	var player_instance = player_scene.instantiate()
	var boss_instance = boss_scene.instantiate()
	
	# If not given a specified gun_array, keep array player default
	if fight_res.gun_array.size() > 0:
		player_instance.player_res.gun_array = fight_res.gun_array
	
	player_name = player_instance.player_res.name
	if not has_node(player_name):
		player_instance.position = fight_res.player_spawn
		add_child(player_instance)
		player_created.emit()
	
	# Not checking with boss because
	# having another boss be added might be on purpose
	#global_position = fight_res.single_boss_spawn
	boss_instance.position = fight_res.single_boss_spawn
	add_child(boss_instance)
	
	# Fight Stats Handling
	GlobalFightStats.reset_inround_fight_stats()
	GlobalFightStats.fight_stats["fight_type"] = fight_res.FIGHT_NAME
	fight_time_tracker.start()

func clear_fight() -> void:
	for child_node in get_children():
		child_node.queue_free()

func _on_fight_time_tracker_timeout() -> void:
	# Increment fight stat time every 1 second
	GlobalFightStats.fight_stats["time"] += 1.0
	GlobalFightStats.fight_stats["total_time"] += 1.0
	
	GlobalFightStats.print_fight_stats()
