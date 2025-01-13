extends CharacterBody2D

@onready var mob_res : MobRes = get_parent().mob_res
@onready var pos_track_delay : float = mob_res.pos_track_delay

@onready var sprite : Sprite2D = $Sprite2D
@onready var track_delay : Timer = $TrackDelay
@onready var collision : CollisionShape2D = $CollisionShape2D
@onready var hitbox : CollisionShape2D = $HitBox/CollisionShape2D

var target_pos : Vector2 = Vector2(0, 0)
var player_pos : Vector2 

var time_passed : float = 0.0
#var cur_move : int = 0  

# IDEA FOR BETTER MOVEMENT HANDLING SYSTEM
# Have single function in physics process that handle which move is currently in action
# Move Manager function takes in MOVE NAME and it's PARAMs ## SCRATCH BECAUSE OF CALLV
# MM function has a MATCH statement of all moves. ## SCRATCH BECAUSE OF CALLV
# There is also a queue which tracks which moves should happen after another
# This allows the boss itself (Ringtail) to pass down func and params via signal
# 	and base_mob can read it

var action_queue : Array = []
var in_use : bool = false

var test_args1 : Array = [player_pos, 0, 50, 10, 5]
var test_args2 : Array = [player_pos, 0.4, 10, 12, 3]

func _ready() -> void:
	sprite.texture = mob_res.texture
	position.y = -100
	
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))
	
	# Example actions with parameters
	action_queue.append({"action": "move_torwards", "params": [player_pos, 0, 50, 10, 5]})
	action_queue.append({"action": "move_torwards", "params": [player_pos, 0.4, 10, 12, 3]})
	
func _physics_process(delta: float) -> void:
	# TODO make queue wait until an action is complete
	if action_queue.size() > 0:
		var cur_action = action_queue.pop_front()
		print(cur_action)
		in_use = true
		call(cur_action["action"], cur_action["params"], delta)
		await in_use == false
		
			
func attack_length(wait_time : float, delta : float) -> void:
	time_passed += delta  
	#print("time passed ", time_passed, "	wait time: ", wait_time)
	if time_passed >= wait_time:
		in_use = false
		time_passed = 0.0

func move_torwards(params: Array, delta: float) -> void:
	var target = player_pos #params[0]
	var delay = params[1]
	var speed = params[2]
	var smooth = params[3]
	var length = params[4]
	
	track_pos(target, delay)
	look_at(target_pos)
	position += ((target_pos - global_position) / smooth) * speed * delta
	attack_length(length, delta)
	#print(length)	
	
	#await get_tree().create_timer(length, false, false, true).timeout
	
func track_pos(cur_data, delay) -> void:
	if delay <= 0:
		target_pos = cur_data
		return 
		
	if track_delay.is_stopped() and (target_pos != cur_data):
		target_pos = cur_data
		track_delay.start(delay)

func wait(seconds : float) -> void:
	print(seconds)
	await get_tree().create_timer(seconds).timeout
		
func _on_get_cur_stats(type, stats):
	if type == "PLAYER":
		player_pos = stats["position"]
