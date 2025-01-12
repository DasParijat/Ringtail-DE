extends CharacterBody2D

@onready var mob_res : MobRes = get_parent().mob_res
@onready var pos_track_delay : float = mob_res.pos_track_delay

@onready var sprite : Sprite2D = $Sprite2D
@onready var track_delay : Timer = $TrackDelay
@onready var collision : CollisionShape2D = $CollisionShape2D
@onready var hitbox : CollisionShape2D = $HitBox/CollisionShape2D

var target_pos : Vector2 = Vector2(0, 0)
var player_pos : Vector2 

var move_towards_count : int = 0 
var in_use : bool = false

func _ready() -> void:
	sprite.texture = mob_res.texture
	position.y = -100
	
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))

var time_passed = 0.0
var current_state = 0  

func _physics_process(delta: float) -> void:
	# TODO Make it dynamic and easily modifiable
	match current_state:
		0:  
			move_torwards(player_pos, 0, 50, 10, 2.0, delta)
			time_passed += delta  
			if time_passed >= 3.0:
				current_state = 1
				time_passed = 0.0
		1: 
			move_torwards(player_pos, 0.4, 10, 12, 3.0, delta)
			time_passed += delta  
			if time_passed >= 3.0:
				current_state = 0
				time_passed = 0.0



func move_torwards(target, delay, speed, smooth, length, delta) -> void:
	#print("speed: ", speed)
	#if not in_use:
		#in_use = true
		#if move_towards_count < length:
	#if not get_tree().create_timer(length).timeout:
	track_pos(target, delay)
	look_at(target_pos)
	position += ((target_pos - global_position) / smooth) * speed * delta
	print(length)
#await get_tree().create_timer(length, false, false, true).timeout
			#move_towards_count += 1
			#print("count: ", move_towards_count, "speed ", speed)
		#in_use = false
		#move_towards_count = 0
		#print("target pos: ", target_pos, "cur pos: ", global_position)
	
		
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
