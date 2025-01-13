extends CharacterBody2D

@onready var mob_res : MobRes = get_parent().mob_res
@onready var pos_track_delay : float = mob_res.pos_track_delay

@onready var sprite : Sprite2D = $Sprite2D
@onready var track_delay : Timer = $TrackDelay
@onready var collision : CollisionShape2D = $CollisionShape2D
@onready var hitbox : CollisionShape2D = $HitBox/CollisionShape2D

var target_pos : Vector2 = Vector2(0, 0)
var player_pos : Vector2 

func _ready() -> void:
	sprite.texture = mob_res.texture
	position.y = -100
	
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))

var time_passed : float = 0.0
var cur_move : int = 0  

func _physics_process(delta: float) -> void:
	# TODO Make it dynamic and easily modifiable
	move_torwards(player_pos, 0, 50, 10, 2, delta, 1)
	move_torwards(player_pos, 0.4, 10, 12, 4, delta, 0)
				
func attack_length(wait_time : float, next_state : int, delta : float) -> void:
	time_passed += delta  
	#print("time passed ", time_passed, "	wait time: ", wait_time)
	if time_passed >= wait_time:
		cur_move = next_state
		time_passed = 0.0

func can_run(next_move : int) -> bool:
	# First condition is cur_move of the func
	# Second condition is for moves at the end of a chain
	return cur_move == (next_move - 1) or next_move == 0
	
func move_torwards(target, delay, speed, smooth, length, delta, next_move) -> void:
	if can_run(next_move):
		track_pos(target, delay)
		look_at(target_pos)
		position += ((target_pos - global_position) / smooth) * speed * delta
		attack_length(length, next_move, delta)
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
