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
var cur_local_time : float = 0.0

var action_queue : Array = []
var cur_action : Dictionary

var test_args1 : Array = [player_pos, 0, 50, 10, 5]
var test_args2 : Array = [player_pos, 0.4, 10, 12, 3]

func _ready() -> void:
	sprite.texture = mob_res.texture
	position.y = -100
	
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))
	
	action_queue.append({"action": "move_torward_player", "params": [0, 50, 10, 2]})
	action_queue.append({"action": "move_torward_player", "params": [0.4, 10, 12, 3]})
	action_queue.append({"action": "move_torward_point", "params": [Vector2(0, 0), 0, 50, 10, 2]})
	
func _physics_process(delta: float) -> void:
	# TODO possibly account for it repeating last action when queue is empty
	
	if action_queue.size() > 0 and cur_attack_time == 0:
		cur_action = action_queue.pop_front()
		print(cur_action)
	
	if cur_action:
		call(cur_action["action"], cur_action["params"], delta)
		
		
func attack_length(wait_time : float, delta : float) -> void:
	cur_attack_time += delta  
	#print("cur_attack_time ", cur_attack_time, "	wait time: ", wait_time)
	if cur_attack_time >= wait_time:
		cur_attack_time = 0.0

func local_wait(wait_time : float, delta : float) -> bool:
	cur_local_time += delta  
	print("cur_local_time ", cur_local_time, "	wait time: ", wait_time)
	if cur_local_time >= wait_time:
		cur_local_time = 0.0
		return true
	return false
		
func move_torward_point(params: Array, delta: float) -> void:
	var target = params[0]
	var delay = params[1]
	var speed = params[2]
	var smooth = params[3]
	var length = params[4]
	
	track_pos(target, delay)
	look_at(target_pos)
	await local_wait(1, delta)
	position += ((target_pos - global_position) / smooth) * speed * delta
	attack_length(length, delta)
	#print(length)	
	
	#await get_tree().create_timer(length, false, false, true).timeout

func move_torward_player(params: Array, delta: float) -> void:
	var target = player_pos 
	var delay = params[0]
	var speed = params[1]
	var smooth = params[2]
	var length = params[3]
	
	track_pos(target, delay)
	look_at(target_pos)
	await local_wait(1, delta)
	position += ((target_pos - global_position) / smooth) * speed * delta
	attack_length(length, delta)
		
func track_pos(cur_data, delay) -> void:
	if delay <= 0:
		target_pos = cur_data 
		return
	elif track_delay.is_stopped() and (target_pos != cur_data):
		target_pos = cur_data
		track_delay.start(delay)

func wait(seconds : float) -> void:
	print(seconds)
	await get_tree().create_timer(seconds).timeout
		
func _on_get_cur_stats(type, stats):
	if type == "PLAYER":
		player_pos = stats["position"]
