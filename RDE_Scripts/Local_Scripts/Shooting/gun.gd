class_name PlayerGun
extends Node2D

@export var gun_index : int = 0  # 0 for primary gun, 1 for secondary gun

@onready var player_res : PlayerRes = get_parent().player_res
@onready var gun_res : GunRes = player_res.gun_array[gun_index]
@onready var bullet_res : BulletRes = gun_res.bullet_res

@onready var shoot_timer : Timer = $ShootTimer
@onready var reload_timer : Timer = $ReloadTimer

@onready var mag_size : int = gun_res.mag_size
@onready var cur_ammo : int = gun_res.cur_ammo

var bullet_load = preload("uid://cy77mdk6wv3fp")
var bullet_spread : float = 0.0

var cur_gun_emitted : bool = false
var is_auto : bool

func _ready() -> void:
	cur_ammo = mag_size
	shoot_timer.wait_time = gun_res.fire_rate
	reload_timer.wait_time = gun_res.reload_time
	is_auto = gun_res.is_automatic
	
	update_ui()
	
	if is_selected():
		GlobalSignal.cur_gun.emit(gun_res)
	
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	position = get_parent().position
	
	if is_selected() and not_reloading() and not GlobalTime.is_paused:
		if can_shoot():
			if is_auto and Input.is_action_pressed("shoot"):
				shoot()
			elif is_auto and !Input.is_action_pressed("shoot") and bullet_spread > 0:
				bullet_spread = 0.0 # reset spread rate when continous shooting stops
				#print("reset ", bullet_spread)
			elif not is_auto and Input.is_action_just_pressed("shoot"): # not auto uses action_just_pressed
				shoot()

		if Input.is_action_just_pressed("reload") or cur_ammo <= 0:
			#print("reload ", bullet_spread)
			reload()
	
		if Input.is_action_just_pressed("switch_weapon"):
			update_ui()
			GlobalSignal.cur_gun.emit(gun_res) # For giving cam shake info to the Cam2D in Game scene
		
func is_selected() -> bool:
	if get_parent().gun_index == gun_index:
		return true
	return false
		
func can_shoot() -> bool:
	return shoot_timer.is_stopped()

func not_reloading() -> bool:
	return reload_timer.is_stopped()

func shoot() -> void:
	if cur_ammo > 0 and not_reloading():
		# bullet_spread equation
		var max_spread = (gun_res.max_spread # Max spread is reduced when aiming and resting
							- (int(Input.is_action_pressed("aim")) * gun_res.max_spread / 4)
							- (int(Input.is_action_pressed("rest")) * gun_res.max_spread / 4))
		bullet_spread += ((max_spread - bullet_spread) * gun_res.spread_rate) 
		#print(bullet_spread)
		
		# for loop for bullets per SINGLE shot
		for i in range(gun_res.bullets_per_shot):
			var bullet = bullet_load.instantiate()
			#print("in shoot(): ",cur_ammo, " ", mag_size, " ", gun_res.fire_rate)
			# resources passed from gun to bullet
			bullet.bullet_res = bullet_res
			bullet.gun_res = gun_res
			
			# bullet transformations			
			bullet.global_transform = global_transform
			bullet.global_rotation_degrees = rotation_degrees + randf_range(-bullet_spread, bullet_spread)
			bullet.target_group = "Enemy"
			
			# putting bullet in fight scene
			get_parent().get_parent().add_child(bullet)
			
			cur_ammo -= 1
			GlobalSignal.emit_signal("get_cur_stats", "GUN", get_cur_stats())
		shoot_timer.start(gun_res.fire_rate)

func update_ui() -> void:
	if is_selected():
		GlobalSignal.emit_signal("get_cur_stats", "GUN", get_cur_stats())
		
func get_cur_stats() -> Dictionary:
	# For giving stats globally the fight_ui can track
	return {
		"cur_ammo": cur_ammo,
		"mag_size": mag_size,
		"gun_type": gun_res.name,
		"gun_image": gun_res.texture,
		"is_reloading": not not_reloading()
	}
	
func reload() -> void:
	print("reloading")
	bullet_spread = 0.0
	match(gun_res.reload_type):
		"AUTO":
			await auto_reload()
		"MANUAL":
			var manual_reload_time = gun_res.reload_time / mag_size
			await manual_reload(manual_reload_time)
			
	if not_reloading():
		update_ui()
		
func auto_reload() -> void:
	#print("Auto reload started")
	reload_timer.start(gun_res.reload_time)
	update_ui()
	await reload_timer.timeout
	cur_ammo = mag_size
	#print("Reload complete")
	#print("check: ", cur_ammo, " ", mag_size)

func manual_reload(manual_reload_time : float) -> void:
	while cur_ammo < mag_size:
		cur_ammo += 1
		reload_timer.start(manual_reload_time)
		update_ui()
		await reload_timer.timeout
		#print("Reloaded 1 bullet, current ammo:", cur_ammo)

	
