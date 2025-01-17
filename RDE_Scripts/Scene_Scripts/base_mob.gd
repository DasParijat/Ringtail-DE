extends CharacterBody2D

@onready var mob_res : MobRes = get_parent().mob_res
@onready var pos_track_delay : float = mob_res.pos_track_delay

@onready var sprite : Sprite2D = $Sprite2D
@onready var track_delay : Timer = $TrackDelay
@onready var collision : CollisionShape2D = $CollisionShape2D
@onready var hitbox : CollisionShape2D = $HitBox/CollisionShape2D

var target_pos : Vector2 = Vector2(0, 0)
var player_pos : Vector2 

var cur_attack_time : float = 0.0
var timeout : bool = true

var action_queue : Array = []
var cur_action : Dictionary

var default_params = {
	"move_torward_player": {"offset": 1, "delay": 0, "speed": 50, "smooth": 10, "length": 1},
	"move_torward_point": {"target": Vector2(0, 0), "delay": 0, "speed": 50, "smooth": 10, "length": 1},
	"move_stop_torward_player": {"offset": 1, "delay": 0, "speed": 50, "smooth": 10, "length": 1},
	"action_duration": 1,
	"observe_player": 1
}

func _ready() -> void:
	sprite.texture = mob_res.texture
	position.y = -100
	
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))
	
	# EXAMPLE ACTIONS
	action("move_stop_torward_player", {})	
	#action("move_torward_player", {"offset": 1, "delay": 0, "speed": 50, "smooth": 10, "length": 2})
	#action("action_duration", 0.5)
	#action("move_torward_point", {"target": Vector2(0, 0), "delay": 0, "speed": 50, "smooth": 10, "length": 2})
	
func _physics_process(delta: float) -> void:
	# TODO possibly account for it repeating last action when queue is empty
	#print(action_queue)
	
	if !(no_action()) and cur_attack_time == 0:
		cur_action = action_queue.pop_front()
		timeout = false
		print(action_queue)
		print("CUR ACTION: ", cur_action, " SIZE: ", action_queue.size())
	
	if cur_action:
		call(cur_action["action"], cur_action["params"], delta)

func action(next_action : String, mod_params) -> void:
	# Adds action to end of queue
	# params data type can be any
	print(next_action)
	print(mod_params)

	var params = mod_params
	if typeof(params) == TYPE_DICTIONARY:
		params = get_modified_params(next_action, mod_params)
		# This is so when action is called, 
		# don't need to give values for all params
	
	action_queue.append({"action": next_action, "params": params})

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
	action_queue.insert(0, {"action": next_action, "params": params})

func no_action() -> bool:
	return action_queue.is_empty()

func get_modified_params(action_name: String, mod: Dictionary) -> Dictionary:
	var new_params = default_params[action_name].duplicate()
	for i in mod.keys():
		new_params[i] = mod[i]
	return new_params

func action_duration(wait_time : float, delta : float) -> void:
	if not timeout:
		cur_attack_time += delta  
	#print("cur_attack_time ", cur_attack_time, "	wait time: ", wait_time)
	if cur_attack_time >= wait_time:
		action_timeout()

func action_timeout() -> void:
	# Used to signal end of action and move to next in queue
	# Can also be used to immediatly skip to the next action
	timeout = true
	cur_attack_time = 0.0
	timeout = false
	
func move_torward(target : Vector2, params : Dictionary, delta : float) -> void:
	var delay = params["delay"]
	var speed = params["speed"]
	var smooth = params["smooth"]
	var length = params["length"]

	track_pos(target, delay)
	look_at(target_pos)
	position += ((target_pos - global_position) / smooth) * speed * delta
	action_duration(length, delta)

func move_torward_point(params : Dictionary, delta : float) -> void:
	var target = params["target"]
	move_torward(target, params, delta)
	
	#await get_tree().create_timer(length, false, false, true).timeout

func move_torward_player(params: Dictionary, delta: float) -> void:
	#print("player execute")
	var offset = params["offset"] 
	# If boss wants to move to a pos in relation to player
	# Ex. Boss wants to go opp coords of player, offset = -1
	
	move_torward((player_pos * offset), params, delta)

func move_stop_torward_player(params : Dictionary, delta : float) -> void:
	action_combo([{"action": "move_torward_player", "params": params}, 
				{"action": "action_duration", "params": params["length"]}])

func observe_player(wait_time : float, delta : float) -> void:
	look_at(player_pos)
	action_duration(wait_time, delta)
	
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
