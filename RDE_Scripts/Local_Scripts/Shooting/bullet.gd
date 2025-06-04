class_name Bullet
extends Area2D

@onready var gun_res : GunRes
@onready var bullet_res : BulletRes 

@onready var damage : float = bullet_res.damage
@onready var texture : Texture2D = bullet_res.texture

@onready var sprite = $Sprite2D
@onready var cpu_particles_2d : CPUParticles2D = $CPUParticles2D
@onready var hit_particles : CPUParticles2D =  $HitParticles

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

var _temp_cpu_load : PackedScene = preload("res://RDE_Scenes/temp_cpu_particle.tscn")

var total_delta : float = 0

func _ready():
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))
	GlobalSignal.connect("game_won", Callable(self, "_on_game_won"))
	if in_group not in ["", "NULL", "NONE"]: add_to_group(in_group)
	
	start_position = global_position
	sprite.texture = texture
	direction = Vector2.RIGHT.rotated(rotation).normalized()
	
	# Bullets can be used as projectiles from mobs
	if gun_res:
		bullet_speed = gun_res.bullet_speed
	
	set_particle_effects()
	
func set_bullet_res(res):
	bullet_res = res
	
func set_particle_effects() -> void:
	if not bullet_res.enable_particle:
		return
	
	# Set each particle effect from bullet_res
	if bullet_res.particle_texture: cpu_particles_2d.texture = bullet_res.particle_texture
	cpu_particles_2d.color = bullet_res.particle_color
	cpu_particles_2d.lifetime = bullet_res.particle_lifetime
	cpu_particles_2d.amount = bullet_res.particle_amount
	cpu_particles_2d.spread = bullet_res.particle_spread
	cpu_particles_2d.gravity = bullet_res.particle_gravity
	cpu_particles_2d.explosiveness = bullet_res.particle_explosiveness
	
	# Start particle effect (oneshot)
	cpu_particles_2d.emitting = true
	
	
func falloff_calc():
	# checks if falloff calculation should be enabled, and to do the calc if true
	if bullet_travelled > bullet_res.falloff_point and damage > 0.07:
		damage -= bullet_res.falloff_rate
		#print("bulscript, falloff calc: ", damage)
		
func _physics_process(delta):
	total_delta += delta
	if total_delta < bullet_res.wait_time:
		if bullet_res.aim_on_wait: follow_target_handling() # works if there's target
		return
	#cpu_particles_2d.emitting = true
	
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
	if (total_delta >= bullet_res.wait_time and
			(
			not follow_target 
			or total_follow_time >= (follow_target_length / 10)
			)
		):
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

func play_hit_effect(parent) -> void:
	## Creates particle effect where it hits entity
	var hit_effect : TempCPUParticle = _temp_cpu_load.instantiate()
	hit_effect.global_transform = global_transform
	hit_effect.global_rotation_degrees = global_rotation_degrees
	get_parent().add_child(hit_effect)
	
	# Set blood color to mob blood color, 
	# if no blood color, then set it to general mob color
	if parent.mob_res.blood_color: 
		hit_particles.color = parent.mob_res.blood_color
	else:
		hit_particles.color = parent.mob_res.color
		
	hit_effect.setup(hit_particles)
		
func exiting() -> void:
	## Handles how bullets exit
	while modulate.a > 0 and bullet_res.fade_on_exit:
		damage = 0
		await GlobalTime.local_wait(0.01)
		modulate.a -= 0.1
		
	queue_free()
	
func _on_game_won() -> void:
	exiting()
	
func _on_tree_exiting() -> void:
	exiting()

	
func _on_area_entered(area : Area2D) -> void:
	if area.is_in_group("Hittable") and area.is_in_group(target_group):
		var parent = area.get_parent()
		parent.health_res.take_dmg(damage)
		parent.take_dmg_flash()
		
		if target_group != "Player":
			# Allows player cur_power to update when hitting enemy
			GlobalSignal.emit_signal("update_power", damage / 300)
			play_hit_effect(parent)
			if parent.mob_res.hurt_sounds: 
				var sound_index : int = randi_range(0, parent.mob_res.hurt_sounds.size() - 1)
				AudioManager.play_audio_one_shot(parent.mob_res.hurt_sounds[sound_index], 
									"Game SFX",
									-5, 
									randf_range(0.9, 1.1)
									)
			
		if not bullet_res.is_piercing:
			#hit_particles.emitting = true
			#await GlobalTime.local_wait(hit_particles.lifetime)
			exiting()
