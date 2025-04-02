class_name BaseMob 
extends CharacterBody2D

@onready var mob_res : MobRes = get_parent().mob_res
@onready var health_res : HealthRes = mob_res.health_comp
@onready var pos_track_delay : float = mob_res.pos_track_delay

@onready var sprite : Sprite2D = $Sprite2D

@onready var track_delay : Timer = $TrackDelay
@onready var iframe_timer : Timer = $IFrameTimer

@onready var local_hp_bar : ProgressBar = $LocalHPBar

@onready var mob_collision : CollisionShape2D = $MobCollisionShape
@onready var hitbox : Area2D = $HitBox

@export var debug_action_queue = false

signal health_res_set

var mob_id : int # Unique id for mob

var target_pos : Vector2 = Vector2(0, 0)
var player_pos : Vector2 
var player_hp : float
var is_near_player : bool = false
var distance_to_player : float = 0.0
var sprite_flip_enabled : bool = true

var player_in_hitbox : bool = false
var damage_cooldown : float = 0.0

var cur_action_time : float = 0.0
var cur_delta : float

var orbit_angle : float = 0.0 # for orbit actions
var rotation_finished : bool = false # for rotation actions
var target_rotation = 0

var action_queue : Array = []
var cur_action : Dictionary

var queue_timer : float = 0

var default_params = {
	"move_torward_player": {"offset": 1, "delay": 0, "speed": 50, "smooth": 50, "length": 1},
	"move_torward_point": {"target": Vector2(0, 0), "delay": 0, "speed": 50, "smooth": 50, "length": 1},
	"orbit_point": {"target": Vector2(0, 0), "radius": 100, "speed": 10, "length": 1},
	"orbit_player": {"offset": 1, "radius": 100, "speed": 10, "length": 1},
	"action_rotate": {"rotate": 90, "speed": 5, "length": 1},
	"move": {"speed": 50, "rotate": 0, "length": 1},
	"move_dir": {"speed": 50, "direction": 90, "length": 1},
	"run_until": true,
	"run_for": 1,
	"action_buffer": 0,
	"observe_player": 1,
	"teleport": Vector2(100, 50)
}

func _ready() -> void:
	mob_id = GMobHandler.get_mob_id()
	
	GMobHandler.num_of_mobs += 1
	if mob_res.is_boss:
		GMobHandler.num_of_bosses += 1
		GMobHandler.boss_queue.append(mob_id)
		
		# Health Bar show/hidden code
		local_hp_bar.hide()
		#if GMobHandler.num_of_bosses < 2:
		#	boss_hp_bars.show()
		
		
	sprite.texture = mob_res.texture
	position = get_parent().position
	#print("boss: ", global_position, "\nboss: ", position)

	if mob_res.collision_enabled:
		mob_collision.disabled = false
		
	if mob_res.is_hittable:
		hitbox.add_to_group("Hittable")
	
	if mob_res.is_enemy:
		hitbox.add_to_group("Enemy")
	
	health_res.set_health_res(iframe_timer)
	health_res_set.emit()
	
	scale = mob_res.mob_size
	mob_collision.scale = mob_res.collision_size
	sprite.scale = mob_res.sprite_size
	hitbox.scale = mob_res.hitbox_size
	
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))
	GlobalSignal.connect("game_won", Callable(self, "_on_game_won"))
	
	set_main_boss_stats()

func _physics_process(delta: float) -> void:
	## Delta updaters
	queue_timer += delta # used to track when actions happen
	cur_delta = delta
	
	## Constant handling
	death_check()
	deal_hitbox_dmg()
	health_bar_handling()
	border_handling()
	player_proximity_detection(mob_res.player_detection_radius)
	sprite_dir_handling()
	
	## Give stats globally if main boss
	set_main_boss_stats() # For when main boss changes
	emit_main_boss_stats() # For constantly emitting current stats if main boss
		
	## Action Queue Handling
	if !(no_action()) and action_timeout(): 
		cur_action = action_queue.pop_front()
		debug_queue(debug_action_queue)
	
	if cur_action:
		call(cur_action["action"], cur_action["params"])
	
			
func death_check() -> void:
	## Check if mob health_res is dead, and respond accordingly
	if health_res.is_dead():
		print("NUM OF BOSSES: ", GMobHandler.num_of_bosses)
		if mob_res.is_boss and GMobHandler.num_of_bosses <= 1:
			GlobalSignal.emit_signal("game_won")
		action_queue.clear()
		get_parent().queue_free()

func deal_hitbox_dmg() -> void:
	## Handles dealing damage to player when in hitbox
	# Breaking when player not in hitbox
	if not player_in_hitbox:
		return
	
	# Increasing cooldown timer and breaking if not yet reach cooldown point
	damage_cooldown += cur_delta
	if damage_cooldown < mob_res.collision_dmg_cooldown:
		return
		
	# Dealing damage to player(s)
	for area in hitbox.get_overlapping_areas():
		if area.is_in_group("Player"):
			area.get_parent().health_res.take_dmg(mob_res.collision_dmg)
	damage_cooldown = 0.0

func health_bar_handling() -> void:
	## Handles updating local hp bar
	if not mob_res.is_boss:
		local_hp_bar.value = health_res.cur_hp
		local_hp_bar.rotation = -rotation

func border_handling() -> void:
	## Handles preventing mob from going beyond world/cam border
	var clamped_pos = Vector2(
		clampf(global_position.x, 0, GlobalScene.cam_border_x),
		clampf(global_position.y, 0, GlobalScene.cam_border_y)
	)

	if global_position > clamped_pos:
		#print("Border hit - Original pos: ", global_position, " Clamped pos: ", clamped_pos)
		global_position = clamped_pos

func sprite_dir_handling() -> void:
	## Handles how sprite looks at direction
	sprite_flip_enabled = mob_res.sprtflip_enabled
	#print(abs(global_rotation_sdegrees), " FLIP: ", sprite.flip_h, " TRUE ROTATE: ", global_rotation_degrees)
	if sprite_flip_enabled:
		sprite.global_rotation_degrees = 0
	else:
		sprite.global_rotation_degrees = global_rotation_degrees
	
	# NOTE: Sprite flip h/v handled outside if statement 
	#		so setting it is only done once rather than twice (one in if, one in else)
	sprite.flip_h = abs(global_rotation_degrees) > 90 and sprite_flip_enabled
	sprite.flip_v = abs(global_rotation_degrees) > 90 and not sprite_flip_enabled
	# flip_v is so when heading in dir, it doesn't look upside-down

func get_cur_stats() -> Dictionary:
	# TODO add stats to give
	## For the main boss to give stats globally that fight_ui can track
	return {
		"position": global_position,
		"max_hp": health_res.max_hp,
		"cur_hp": health_res.cur_hp,
		"mob_res": mob_res
	}

func emit_main_boss_stats() -> void:
	if not GMobHandler.boss_queue.is_empty():
		if GMobHandler.boss_queue[0] == mob_id:
			GlobalSignal.emit_signal("get_cur_stats", "MAIN_BOSS", get_cur_stats())
			
func set_main_boss_stats() -> void:
	if not GMobHandler.boss_queue.is_empty():
		if GMobHandler.boss_queue[0] == mob_id and GMobHandler.prev_main_boss != GMobHandler.boss_queue[0]:
			GlobalSignal.emit_signal("get_cur_stats", "MAIN_BOSS_START", get_cur_stats())
			GMobHandler.prev_main_boss = GMobHandler.boss_queue[0]
			
func action(next_action : String, mod_params) -> void:
	## Adds action to end of queue
	# params data type can be any
	var params = mod_params
	if typeof(params) == TYPE_DICTIONARY:
		params = get_modified_params(next_action, mod_params)
		# This is so when action is called, 
		# don't need to give values for all params
	
	action_queue.append({"action": next_action, "params": params})

func action_combo(actions : Array) -> void:
	## This will add a combo of actions to the queue itself
	actions.reverse() 
	# Reversing makes action sequence line up with 
	# 	how it's listed in given array (due to use of action_now)
	
	for action_prop in actions:
		action_now(action_prop["action"], action_prop["params"])
		
func action_now(next_action : String, params) -> void:
	# Adds action to be next executed regardless
	action_queue.insert(0, {"action": next_action, "params": params})
	
func no_action() -> bool:
	## True if action queue is empty
	return action_queue.is_empty()

func can_change_action() -> bool:
	## Used for parent to check whether they can change action or not
	return no_action() and not GlobalTime.is_paused
	
func debug_queue(can_print : bool) -> void:
	## Used to print out action queue related info
	if not can_print:
		return
		
	print("--[QUEUE_DEBUG]-----------------------------------------")
	print("|	NAME: ", mob_res.name)
	print("|	Q: ", action_queue)
	print("|	CUR_ACT: ", cur_action, " SIZE: ", action_queue.size())
	print("|	TIME: ", queue_timer)
	print("--------------------------------------------------------")
	
func get_modified_params(action_name: String, mod: Dictionary) -> Dictionary:
	## Any length of params is taken in, and combined with the rest of the default params.
	var new_params = default_params[action_name].duplicate()
	for i in mod.keys():
		new_params[i] = mod[i]
	return new_params

func set_default_params(new_def: Dictionary) -> void:
	## For changing the default params of an action
	for i in new_def.keys():
		default_params[i] = new_def[i].duplicate()

## WAIT ACTIONS/FUNC

func run(length) -> void:
	## Used for if action can handle both run_until and run_for
	if typeof(length) == TYPE_BOOL:
		run_until(length)
	elif str(length).is_valid_float():
		run_for(float(length))
	else:
		print("ERROR: base_mob run() - length not valid")
		cur_action_time = 0.01
		# prevents timeout, allow action to go until otherwise
		# so run can be handled outside of it
		
func run_until(condition : bool) -> void:
	## action runs till condition is met
	cur_action_time += cur_delta # for if time passed needs to be compared
	if condition or cur_action_time == 0.0:
		cur_action_time = 0.0
		rotation_finished = false
		orbit_angle = 0.0
		
func run_for(wait_time : float) -> void:
	## action runs for a set amount of time
	run_until(cur_action_time >= wait_time)

func action_timeout() -> bool:
	## When action is over
	return cur_action_time == 0.0

func action_break() -> void:
	## Used to break out of current action
	cur_action_time = 0.0
	rotation_finished = false
	orbit_angle = 0.0
	
func action_buffer(length : float) -> void:
	## Buffer is used to stop boss from immediatly moving on to next action sequence 
	run_for(length)

## ACTIONS

func move(params : Dictionary) -> void:
	## Move in current direction, can tilt via rotate
	var speed = params["speed"]
	var rotate = params["rotate"]
	var length = params["length"]
	
	var direction = Vector2.RIGHT.rotated(rotation) 
	position += direction * speed * cur_delta
	rotation += rotate * cur_delta
		
	run(length)

func action_rotate(params : Dictionary) -> void:
	## Rotates to point to a specific direction
	var speed = params["speed"]
	var length = params["length"]
	var rotate_amt = deg_to_rad(params["rotate"])
	
	if target_rotation == 0:
		# only update target rotation once per action
		target_rotation = rotate_amt + rotation
	
	var angle_diff = target_rotation - rotation
	rotation += angle_diff * speed * cur_delta
	
	#print("ROTATION: ", rotation, " target: ", target_rotation)
	target_rotation = snappedf(target_rotation, 0.1) 
	if abs(rotation - target_rotation) < 0.1:
		#print("rotate check: ", rotation_finished)
		rotation_finished = true
		target_rotation = 0
	
	if typeof(length) == TYPE_BOOL:
		run_until(rotation_finished)
	else:
		run(length)
		
func move_dir(params : Dictionary) -> void:
	## Rotate into direction, and move
	var direction = params["direction"]
	var speed = params["speed"]
	var length = params["length"]
	
	action_combo([{"action": "action_rotate", "params": {"rotate": direction, "speed": 100, "length": true}},
				{"action": "move", "params": {"speed": speed, "length": length}}])
					
func move_torward(target : Vector2, params : Dictionary) -> void:
	## Moves torward a target, used as base for other move func
	var delay = params["delay"]
	var speed = params["speed"]
	var smooth = params["smooth"]
	var length = params["length"]
	
	track_pos(target, delay)
	look_at(target_pos)
	position += ((target_pos - global_position) / smooth) * speed * cur_delta
	
	run(length)
	
func move_torward_point(params : Dictionary) -> void:
	## Move torward a Vector2 point
	var target = params["target"]
	
	move_torward(target, params)

func move_torward_player(params: Dictionary) -> void:
	## Move torward player
	var offset = params["offset"] 
	# If boss wants to move to a pos in relation to player
	# Ex. Boss wants to go opp coords of player, offset = -1
	
	move_torward((player_pos * offset), params)

func orbit(target : Vector2, params: Dictionary) -> void:
	## Circle around a target, used as base for other orbit func
	var radius = params["radius"]
	var speed = params["speed"]
	var length = params["length"]

	orbit_angle += speed * cur_delta
	var offset = Vector2(cos(orbit_angle) * radius, sin(orbit_angle) * radius)
	position = target + offset
	look_at(target)

	run_for(length)

func orbit_point(params : Dictionary) -> void:
	## Circle around a Vector2 point
	var target = params["target"]
	orbit(target, params)
	
func orbit_player(params : Dictionary) -> void:
	## Circle around the player
	var offset = params["offset"]
	orbit((player_pos * offset), params)

func observe_player(length : float) -> void:
	## Look at player for a specified length
	look_at(player_pos)
	run(length)

func teleport(target : Vector2) -> void:
	## Teleport to Vector2 point
	position = target
	run_until(true) # true parameter means action will timeout immediatly
	
func track_pos(cur_data, delay : float) -> void:
	## Tracks a target with delay (or no delay at all)
	if delay <= 0:
		target_pos = cur_data 
		return
	elif track_delay.is_stopped() and (target_pos != cur_data):
		target_pos = cur_data
		track_delay.start(delay)

func player_proximity_detection(detection_radius : float) -> void:
	## Updates is_near_player accordingly
	if distance_to_player < detection_radius:
		is_near_player = true
	else:
		is_near_player = false
		
func _on_get_cur_stats(type, stats):
	## Gets player stats and distance to player
	if type == "PLAYER":
		player_pos = stats["position"]
		player_hp = stats["cur_hp"]
		
		distance_to_player = player_pos.distance_to(global_position)
		#print("distance to play: ", distance_to_player)

func _on_game_won() -> void:
	## What mob does when game won
	print("base mob:  game won")

## Area2D Collisions
func _on_hit_box_area_entered(area: Area2D) -> void:
	## Starts dealing dmg to player if in hitbox
	if area.is_in_group("Player"):
		player_in_hitbox = true
		damage_cooldown = mob_res.collision_dmg_cooldown
		
func _on_hit_box_area_exited(area: Area2D) -> void:
	## Stops dealing dmg to player if out of hitbox
	if area.is_in_group("Player"):
		player_in_hitbox = false
		damage_cooldown = 0.0
		
func _on_tree_exiting() -> void:
	## Decrement num of mobs and/or num of bosses
	GMobHandler.num_of_mobs -= 1
	if mob_res.is_boss:
		GMobHandler.num_of_bosses -= 1
		GMobHandler.boss_queue.erase(mob_id)
