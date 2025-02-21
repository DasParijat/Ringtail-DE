extends CharacterBody2D
# Handles code that every playable character uses

@onready var player_res : PlayerRes = get_parent().player_res
@onready var health_res : HealthRes = player_res.health_res

@onready var sprite : Sprite2D = $Sprite2D
@onready var player_collision : CollisionShape2D = $BaseCollision
@onready var iframe_timer : Timer = $IFrameTimer

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
	
	position = get_parent().position
	GlobalSignal.emit_signal("get_cur_stats", "PLAYER", get_cur_stats())
	#print("player: ", global_position, "\nplayer: ", position)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	GlobalSignal.emit_signal("get_cur_stats", "PLAYER", get_cur_stats())
	movement(player_res.cur_speed)
	
	rest_check(delta)
	death_check()
	test_function()

func movement(cur_speed : float) -> void:
	look_at(get_global_mouse_position())
	
	cur_speed = player_res.base_speed
	if Input.is_action_pressed("sprint"):
		cur_speed = player_res.sprint_speed
		
	if Input.is_action_pressed("rest"):
		cur_speed = player_res.rest_speed
		# TODO add way to actually heal when restings
	
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down") 
	velocity = input_direction * (cur_speed * speed_modifier)
	
	move_and_slide()

func rest_check(delta):
	# NOTE: Doesn't run when hp is max, 
	#	else player can increase rest_timeout to an unintended value 
	#	and possibly cheese game. 
	if Input.is_action_pressed("rest") and not health_res.is_max_hp: 
		rest_timeout += delta
		if rest_timeout >= player_res.regen_rate:
			health_res.cur_hp += player_res.regen_amt
			rest_timeout = 0.0
	
func set_speedmod(new_val : float) -> void:
	speed_modifier = new_val

func death_check() -> void:
	if health_res.is_dead():
		print("RIP BOZO")
		GlobalSignal.game_over.emit()
		# Takes in signal within base player code

func get_cur_stats() -> Dictionary:
	# For giving stats globally the fight_ui can track
	return {
		"position": global_position,
		"max_hp": health_res.max_hp,
		"cur_hp": health_res.cur_hp,
		"is_hurting": is_hurting or is_near_enemy,
		"max_power": player_res.max_power,
		"cur_power": round(player_res.cur_power),
	}

func _on_hit_box_area_entered(area: Area2D) -> void:
	is_hurting = true

func _on_hit_box_area_exited(area: Area2D) -> void:
	is_hurting = false
	
func _on_hostile_detection_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		is_near_enemy = true
		
func _on_hostile_detection_area_exited(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		is_near_enemy = false
		
func _on_game_over() -> void:
	#health_res.reset_health()
	GlobalScene.load_next_scene(GlobalScene.GAME_OVER)
	
func test_function() -> void:
	if Input.is_action_pressed("test"):
		player_res.health_res.take_dmg(10)
