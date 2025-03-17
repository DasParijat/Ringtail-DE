extends CharacterBody2D
# Handles code that every playable character uses

@onready var player_res : PlayerRes = get_parent().player_res
@onready var health_res : HealthRes = player_res.health_res

@onready var sprite : Sprite2D = $Sprite2D
@onready var collision : CollisionShape2D = $BaseCollision
@onready var player_collision : CollisionShape2D = $BaseCollision
@onready var iframe_timer : Timer = $IFrameTimer

@onready var hitbox : Area2D = $HitBox
@onready var hostile_detect : Area2D = $HostileDetection

var speed_modifier : float = 1
var rest_timeout : float = 0.0

var is_near_enemy : bool = false
var is_hurting : bool = false

func _ready() -> void:
	sprite.texture = player_res.texture
	
	player_res.reset_speed()
	player_res.reset_power_rate()
	
	health_res.set_health_res(iframe_timer)
	
	GlobalSignal.connect("game_over", Callable(self, "_on_game_over"))
	GlobalSignal.connect("update_power", Callable(self, "_on_update_power"))
	
	scale = player_res.player_size
	collision.scale = player_res.collision_size
	hitbox.scale = player_res.hitbox_size
	hostile_detect.scale = player_res.hostile_detect_size
	
	position = get_parent().position
	GlobalSignal.emit_signal("get_cur_stats", "PLAYER", get_cur_stats())
	#print("player: ", global_position, "\nplayer: ", position)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Constantly updating global player stats
	GlobalSignal.emit_signal("get_cur_stats", "PLAYER", get_cur_stats())
	movement(player_res.cur_speed) # Where movement is handled
	
	player_res.cur_power = clampf(player_res.cur_power, 0, player_res.max_power)
	
	# Checks
	if not GlobalTime.is_paused:
		rest_check(delta)
		death_check()
		test_function()

func movement(cur_speed : float) -> void:
	## Handles all movement of player
	look_at(get_global_mouse_position())
	
	# Speed handling
	cur_speed = player_res.base_speed
	if Input.is_action_pressed("sprint"):
		cur_speed = player_res.sprint_speed
		
	if Input.is_action_pressed("rest"):
		cur_speed = player_res.rest_speed
	
	# Input handling / Sets final speed
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down") 
	velocity = input_direction * (cur_speed * speed_modifier)
	
	move_and_slide() # actual movement

func rest_check(delta):
	## Handles when player "rests" (pressing rest button)
	# NOTE: Doesn't run when hp is max, 
	#	else player can increase rest_timeout to an unintended value 
	#	and possibly cheese game. 
	if Input.is_action_pressed("rest") and not health_res.is_max_hp: 
		rest_timeout += delta
		if rest_timeout >= player_res.regen_rate:
			# When at max power, more health will regen
			var health_gain : float = clampf(player_res.regen_amt * (player_res.cur_power / 75), 0.5, player_res.regen_amt)
			health_res.cur_hp += health_gain
			print(health_gain)
			rest_timeout = 0.0
	
func set_speedmod(new_val : float) -> void:
	## Modify speed_modifier
	speed_modifier = new_val

func death_check() -> void:
	## Checks if player is dead, and emits game over signal
	if health_res.is_dead():
		print("RIP BOZO")
		GlobalSignal.game_over.emit()
		# Takes in signal within base player code

func get_cur_stats() -> Dictionary:
	## For giving stats globally the fight_ui can track
	return {
		"position": global_position,
		"player_res": player_res,
		"max_hp": health_res.max_hp,
		"cur_hp": health_res.cur_hp,
		"is_hurting": is_hurting or is_near_enemy, # For health bar
		"max_power": player_res.max_power,
		"cur_power": round(player_res.cur_power),
		"player_pri_color": player_res.primary_color,
		"player_sec_color": player_res.secondary_color
	}

func _on_hit_box_area_entered(area: Area2D) -> void:
	## Updates player is being hurt
	is_hurting = true

func _on_hit_box_area_exited(area: Area2D) -> void:
	## Updates player is not being hurt
	is_hurting = false
	
func _on_hostile_detection_area_entered(area: Area2D) -> void:
	## Sets is_near_enemy to true
	if area.is_in_group("Enemy"):
		is_near_enemy = true
		
func _on_hostile_detection_area_exited(area: Area2D) -> void:
	## Sets is_near_enemy to false
	if area.is_in_group("Enemy"):
		is_near_enemy = false

func _on_update_power(power_update : float) -> void:
	if is_near_enemy: 
		# power given has (near_enemy_boost)% increase when near enemy
		power_update += power_update * player_res.power_near_enemy_boost  
	
	player_res.cur_power += power_update
	
func _on_game_over() -> void:
	## Switches to game over scene
	#health_res.reset_health()
	GlobalScene.load_next_scene(GlobalScene.GAME_OVER)
	
func test_function() -> void:
	## If test button pressed, something happens
	if Input.is_action_pressed("test"):
		player_res.health_res.take_dmg(10)
