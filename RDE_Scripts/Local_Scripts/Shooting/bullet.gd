class_name Bullet
extends Area2D

@onready var gun_res : GunRes
@onready var bullet_res : BulletRes 

@onready var damage : float = bullet_res.damage
@onready var texture : Texture2D = bullet_res.texture

@onready var sprite = $Sprite2D
@onready var audio_stream : AudioStreamPlayer2D = $AudioStreamPlayer2D

var bullet_travelled : float
var bullet_speed : float = 100

var start_position : Vector2
var direction : Vector2  

var target_group : String
var in_group : String = "in_group"

var follow_target : bool = false
var follow_target_length : float = 1
var total_follow_time : float = 0.0

var player_pos : Vector2
var main_boss_pos : Vector2

func _ready():
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))
	if in_group not in ["", "NULL", "NONE"]: add_to_group(in_group)
	
	start_position = global_position
	sprite.texture = texture
	direction = Vector2.RIGHT.rotated(rotation).normalized()
	
	# Play gun shot sound when spawned
	audio_stream.stream = bullet_res.gun_shot_sound
	audio_stream.pitch_scale = randf_range(0.8, 1.2)
	audio_stream.play()
	
	# Bullets can be used as projectiles from mobs
	if gun_res:
		bullet_speed = gun_res.bullet_speed
	
func set_bullet_res(res):
	bullet_res = res
	
	
func falloff_calc():
	# checks if falloff calculation should be enabled, and to do the calc if true
	if bullet_travelled > bullet_res.falloff_point:
		damage -= bullet_res.falloff_rate
		#print("bulscript, falloff calc: ", damage)
		
func _physics_process(delta):
	position += transform.x * bullet_speed * delta
	follow_target_handling()
		
	bullet_travelled = global_position.distance_to(start_position)
	falloff_calc()
	
	if damage < 0:
		if modulate.a > 0:
			# if else statement used to make sure bullet queue frees when modulate <= 0
			modulate.a -= bullet_res.falloff_rate / 2
		else:
			queue_free()

func follow_target_handling() -> void:
	if not follow_target or total_follow_time >= (follow_target_length / 10):
		return
	
	if target_group == "Player" and player_pos.distance_to(global_position) > 100:
		look_at(player_pos)
	elif target_group == "Enemy" and main_boss_pos.distance_to(global_position) > 100:
		look_at(main_boss_pos)
		
	total_follow_time += get_process_delta_time()
	
func _on_get_cur_stats(type, stats) -> void:
	match(type):
		"PLAYER":
			player_pos = stats["global_pos"]
		"MAIN_BOSS":
			main_boss_pos = stats["position"]
			
func _on_tree_exiting() -> void:
	queue_free()

func _on_area_entered(area : Area2D) -> void:
	if area.is_in_group("Hittable") and area.is_in_group(target_group):
		var parent = area.get_parent()
		parent.health_res.take_dmg(damage)
		
		if target_group != "Player":
			# Allows player cur_power to update when hitting enemy
			GlobalSignal.emit_signal("update_power", damage / 2)
		
		if not bullet_res.is_piercing:
			queue_free()
