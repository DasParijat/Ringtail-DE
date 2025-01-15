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

func _ready() -> void:
	sprite.texture = mob_res.texture
	position.y = -100
	
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))
	
	action("observe_player", 1)
	action("move_stop_torward_player", [1.5, 1, 0, 50, 10, 2])
	#action("move_torward_player", [1, 0, 50, 10, 2])
	#action("action_duration", 1)
	#action("move_torward_player", [1.5, 0.4, 10, 12, 3])
	#action("action_duration", 0.5)
	action("move_torward_point", [Vector2(0, 0), 0, 50, 10, 2])
	
func _physics_process(delta: float) -> void:
	# TODO possibly account for it repeating last action when queue is empty
	#print(action_queue)
	
	if action_queue.size() > 0 and cur_attack_time == 0:
		cur_action = action_queue.pop_front()
		timeout = false
		print(cur_action)
	
	if cur_action:
		call(cur_action["action"], cur_action["params"], delta)

func action(next_action : String, params) -> void:
	# Adds action to end of queue
	# params data type can be any
	action_queue.append({"action": next_action, "params": params})

func action_combo(actions : Array) -> void:
	# This will add multiple actions to the queue itself
	# So an action can be a COMBO of other existing actions
	actions.reverse() 
	# Due to action_now putting new actions in index 0,
	# The last item in array is first executed
	# Thus reversing makes action sequence line up with 
	# 	how it's listed in given array
	
	for action_prop in actions:
		action_now(action_prop["action"], action_prop["params"])
		
func action_now(next_action : String, params) -> void:
	# Adds action to be next executed regardless
	action_queue.insert(0, {"action": next_action, "params": params})
	
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
	
func move_torward(target : Vector2, params : Array, delta : float) -> void:
	var delay = params[0]
	var speed = params[1]
	var smooth = params[2]
	var length = params[3]
	
	track_pos(target, delay)
	look_at(target_pos)
	position += ((target_pos - global_position) / smooth) * speed * delta
	action_duration(length, delta)
	
	# torward_player and torward_point are seperate, 
	# as _player actively gets cur player pos, 
	# while _point relies on initial coords given
	
func move_torward_point(params : Array, delta : float) -> void:
	#print("point execute")
	var target = params[0]
	move_torward(target, params.slice(1), delta)
	
	#await get_tree().create_timer(length, false, false, true).timeout

func move_torward_player(params: Array, delta: float) -> void:
	#print("player execute")
	var offset = params[0] 
	# If boss wants to move to a pos in relation to player
	# Ex. Boss wants to go opp coords of player, offset = -1
	
	move_torward((player_pos * offset), params.slice(1), delta)

func move_stop_torward_player(params : Array, delta : float) -> void:
	action_combo([{"action": "move_torward_player", "params": params.slice(1)}, 
				{"action": "action_duration", "params": params[0]}])

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
