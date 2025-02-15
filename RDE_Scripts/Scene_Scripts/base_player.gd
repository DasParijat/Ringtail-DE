extends CharacterBody2D
# Handles code that every playable character uses

@onready var player_res : PlayerRes = get_parent().player_res
@onready var health_res : HealthRes = player_res.health_res

@onready var sprite : Sprite2D = $Sprite2D
@onready var player_collision : CollisionShape2D = $BaseCollision
@onready var iframe_timer : Timer = $IFrameTimer

var speed_modifier : float = 1
var is_near_enemy : bool = false


func _ready() -> void:
	sprite.texture = player_res.texture
	
	player_res.reset_speed()
	player_res.reset_power_rate()
	
	health_res.set_health_res(iframe_timer)
	
	GlobalSignal.connect("game_over", Callable(self, "_on_game_over"))
	
	global_position = Vector2(0, 10)
	#global_position = get_parent().position
	# for some reason if set at (0, 0), 
	# it will occasionally spawn further away
	print(global_position)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	GlobalSignal.emit_signal("get_cur_stats", "PLAYER", get_cur_stats())
	movement(player_res.cur_speed)
	
	death_check()
	test_function()

func movement(cur_speed : float) -> void:
	look_at(get_global_mouse_position())
	
	cur_speed = player_res.base_speed
	if Input.is_action_pressed("sprint"):
		cur_speed = player_res.sprint_speed
	if Input.is_action_pressed("rest"):
		cur_speed = player_res.rest_speed
	
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down") 
	velocity = input_direction * (cur_speed * speed_modifier)
	
	move_and_slide()

func set_speedmod(new_val : float) -> void:
	speed_modifier = new_val

func death_check() -> void:
	if health_res.is_dead():
		print("RIP BOZO")
		GlobalSignal.game_over.emit()
		# TODO create global signal that tells everyone player died

func get_cur_stats() -> Dictionary:
	# For giving stats globally the fight_ui can track
	return {
		"position": global_position,
		"cur_hp": health_res.cur_hp,
		"cur_power": round(player_res.cur_power),
	}

func _on_hostile_detection_area_entered(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		is_near_enemy = true
		
func _on_hostile_detection_area_exited(area: Area2D) -> void:
	if area.is_in_group("Enemy"):
		is_near_enemy = false
		
func _on_game_over() -> void:
	health_res.reset_health()
	
func test_function() -> void:
	if Input.is_action_pressed("test"):
		player_res.health_res.take_dmg(3.5)
