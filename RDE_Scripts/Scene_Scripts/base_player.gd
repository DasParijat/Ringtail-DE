extends CharacterBody2D
# Handles code that every playable character uses

@onready var player_res : PlayerRes = get_parent().player_res
@onready var health_res : HealthRes = player_res.health_res

@onready var sprite : Sprite2D = $Sprite2D
@onready var collision : CollisionShape2D = $CollisionShape2D
@onready var iframe_timer : Timer = $IFrameTimer

var speed_modifier : float = 1


func _ready() -> void:
	sprite.texture = player_res.texture
	
	player_res.reset_speed()
	player_res.reset_power_rate()
	
	health_res.set_health_res(iframe_timer)
	
	position = Vector2(0, 0)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	GlobalSignal.emit_signal("get_cur_stats", "PLAYER", player_res.get_cur_stats())
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
		health_res.reset_health()
		# TODO create global signal that tells everyone player died
	
func test_function() -> void:
	if Input.is_action_pressed("test"):
		player_res.health_res.take_dmg(3.5)
