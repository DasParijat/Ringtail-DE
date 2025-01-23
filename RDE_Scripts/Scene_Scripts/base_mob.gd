extends CharacterBody2D

@onready var mob_res : MobRes = get_parent().mob_res
@onready var pos_track_delay : float = mob_res.pos_track_delay

@onready var sprite : Sprite2D = $Sprite2D
@onready var track_delay : Timer = $TrackDelay
@onready var collision : CollisionShape2D = $CollisionShape2D
@onready var hitbox : CollisionShape2D = $HitBox/CollisionShape2D

var target_pos : Vector2 = Vector2(0, 0)
var player_pos : Vector2 
var player_hp : float

var cur_action_time : float = 0.0
var no_hold : bool = true

var action_queue : Array = []
var cur_action : Dictionary

var queue_timer : float = 0

var default_params = {
	"move_torward_player": {"offset": 1, "delay": 0, "speed": 50, "smooth": 50, "length": 1},
	"move_torward_point": {"target": Vector2(0, 0), "delay": 0, "speed": 50, "smooth": 50, "length": 1},
	"move_stop_torward_player": {"offset": 1, "delay": 0, "speed": 50, "smooth": 50, "length": 1},
	"run_until": true,
	"run_for": 1,
	"action_buffer": 0,
	"action_hold": true,
	"observe_player": 1
}

# ACTION IDEAS:
# move_torward - default moving used as base
# move_torward_point - move torward point, end when at point
# move_torward_player - move torward player 
# orbit - goes in a circle around a point
# orbit_player -  goes in circle around player
# observe_player - look at player pos
# rotate - turn in a certain direction (degrees)
# move_rotate - like rotate except while moving
# teleport - go insantly to a point 



func _ready() -> void:
	sprite.texture = mob_res.texture
	position.y = -100
	
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))
	
	# EXAMPLE ACTIONS
	#action("move_stop_torward_player", {})	
	#action("move_torward_player", {"offset": 1, "delay": 0, "speed": 50, "smooth": 10, "length": 2})
	#action("run_for", 0.5)
	#action("move_torward_point", {"target": Vector2(0, 0), "delay": 0, "speed": 50, "smooth": 10, "length": 2})
	
func _physics_process(delta: float) -> void:
	#print(player_hp)
	queue_timer += delta # used to track when actions happen
	
	if !(no_action()) and action_timeout(): #and no_hold:
		#if no_hold:
		cur_action = action_queue.pop_front()
		debug_queue(true)
	
	if no_action():
		cur_action = {"action": "action_buffer", "params": 0}
			
	if cur_action:
		call(cur_action["action"], cur_action["params"], delta)

func action(next_action : String, mod_params) -> void:
	# Adds action to end of queue
	# params data type can be any
	var params = mod_params
	if typeof(params) == TYPE_DICTIONARY:
		params = get_modified_params(next_action, mod_params)
		# This is so when action is called, 
		# don't need to give values for all params
	
	#if no_hold:
	action_queue.append({"action": next_action, "params": params})
	#action_queue.append({"action": "action_buffer", "params": 0})

func action_combo(actions : Array) -> void:
	# This will add multiple actions to the queue itself
	# So an action can be a COMBO of other existing actions
	actions.reverse() 
	# Reversing makes action sequence line up with 
	# 	how it's listed in given array (due to use of action_now)
	
	for action_prop in actions:
		action_now(action_prop["action"], action_prop["params"])
		
func action_now(next_action : String, params) -> void:
	# Adds action to be next executed regardless
	#if no_hold:
	action_queue.insert(0, {"action": next_action, "params": params})
	#action_queue.insert(0, {"action": "action_buffer", "params": 0})

func no_action() -> bool:
	return action_queue.is_empty()

func debug_queue(can_print : bool) -> void:
	if not can_print:
		return
		
	print("--[QUEUE_DEBUG]-----------------------------------------")
	print("|	Q: ", action_queue)
	print("|	CUR_ACT: ", cur_action, " SIZE: ", action_queue.size())
	print("|	TIME: ", queue_timer)
	print("--------------------------------------------------------")
	
func get_modified_params(action_name: String, mod: Dictionary) -> Dictionary:
	var new_params = default_params[action_name].duplicate()
	for i in mod.keys():
		new_params[i] = mod[i]
	return new_params

func set_default_params(new_def: Dictionary) -> void:
	for i in new_def.keys():
		default_params[i] = new_def[i].duplicate()

## WAIT ACTIONS/FUNC

func run_until(condition : bool, delta : float) -> void:
	# action runs till condition is met
	cur_action_time += delta #* int(no_hold) # for if time passed needs to be compared
	if condition:
		cur_action_time = 0.0
		
func run_for(wait_time : float, delta : float) -> void:
	# action runs for a set amount of time
	run_until(cur_action_time >= wait_time, delta)
	
func action_timeout() -> bool:
	return cur_action_time == 0.0

func action_buffer(length : float, delta : float) -> void:
	# Buffer is used to stop boss from immediatly 
	# moving on to next action sequence 
	run_for(length, delta)

func hold(start_hold : bool) -> void:
	# delta is here so it can be used with action
	if start_hold:
		no_hold = false
		#action("action_hold", true)
	else:
		no_hold = true

func action_hold(params, delta : float) -> void:
	# action doesn't take in params
	run_until(no_hold, delta)
	
## ACTIONS

func move_torward(target : Vector2, params : Dictionary, delta : float) -> void:
	var delay = params["delay"]
	var speed = params["speed"]
	var smooth = params["smooth"]
	var length = params["length"]
	
	track_pos(target, delay)
	look_at(target_pos)
	position += ((target_pos - global_position) / smooth) * speed * delta
	
	if typeof(length) == TYPE_BOOL:
		run_until(length, delta)
	elif length == null:
		cur_action_time = 0.01
		# prevents timeout, allow action to go until otherwise
		# so run can be handled outside of it
	else:
		run_for(length, delta)
	
func move_torward_point(params : Dictionary, delta : float) -> void:
	var target = params["target"]
		
	move_torward(target, params, delta)

func move_torward_player(params: Dictionary, delta: float) -> void:
	#print("player execute")
	var offset = params["offset"] 
	# If boss wants to move to a pos in relation to player
	# Ex. Boss wants to go opp coords of player, offset = -1
	
	move_torward((player_pos * offset), params, delta)

func move_stop_torward_player(params : Dictionary, delta : float) -> void:
	action_combo([{"action": "move_torward_player", "params": params}, 
				{"action": "run_for", "params": params["length"]}])

func observe_player(wait_time : float, delta : float) -> void:
	look_at(player_pos)
	run_for(wait_time, delta)
	
func track_pos(cur_data, delay) -> void:
	if delay <= 0:
		target_pos = cur_data 
		return
	elif track_delay.is_stopped() and (target_pos != cur_data):
		target_pos = cur_data
		track_delay.start(delay)

func wait(seconds : float) -> void:
	# I MIGHT USE THIS ELSEWARE (im keeping this typo)
	print(seconds)
	await get_tree().create_timer(seconds).timeout
		
func _on_get_cur_stats(type, stats):
	if type == "PLAYER":
		player_pos = stats["position"]
		player_hp = stats["cur_hp"]
