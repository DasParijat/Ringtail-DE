class_name PlayerGun
extends Node2D

@export var gun_index : int = 0  # 0 for primary gun, 1 for secondary gun

@onready var player_res : PlayerRes = get_parent().player_res
@onready var gun_res : GunRes = player_res.gun_array[gun_index]
@onready var bullet_res : BulletRes = gun_res.bullet_res

@onready var shoot_timer : Timer = $ShootTimer
@onready var reload_timer : Timer = $ReloadTimer
@onready var reload_text : Label = $ReloadText

@onready var mag_size : int = gun_res.mag_size
@onready var cur_ammo : int = gun_res.cur_ammo

var bullet_load = preload("uid://cy77mdk6wv3fp")
var bullet_spread : float = 0.0

var cur_gun_emitted : bool = false
var is_auto : bool

var gun_usable : bool = true

func _ready() -> void:
	cur_ammo = mag_size
	shoot_timer.wait_time = gun_res.fire_rate
	reload_timer.wait_time = gun_res.reload_time
	is_auto = gun_res.is_automatic
	
	update_ui()
	
	GlobalSignal.connect("game_won", Callable(self, "_on_game_won"))
	if is_selected():
		GlobalSignal.cur_gun.emit(gun_res)
	
func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	position = get_parent().position
	
	reload_text_handling()
	
	if is_selected() and not_reloading() and gun_usable and not GlobalTime.is_paused:
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
	## Gets to parent node to see if player selected it's gun
	if get_parent().gun_index == gun_index:
		return true
	return false

func can_shoot() -> bool:
	## Gap between each shot
	return shoot_timer.is_stopped()

func not_reloading() -> bool:
	## Reload timer is not active, hence not reloading
	return reload_timer.is_stopped()
	
func reload_text_handling() -> void:
	## This is for the reload text that appeares directly under player
	if not_reloading():
		reload_text.hide()
		return
	
	## Sets text to semi transparent if gun not selected
	## Not completely hidden so player is aware other gun is still reloading
	if is_selected():
		reload_text.self_modulate = Color(1, 1, 1)
	else:
		reload_text.self_modulate = Color(1, 1, 1, 0.3)
		
	reload_text.show()
	reload_text.global_position = global_position + Vector2(-56, 35) # Specifc pos makes it centered
	reload_text.rotation = -global_rotation # This makes it remain 0 degrees no matter what

func shoot_sound_effect() -> void:
	AudioManager.play_audio_one_shot(bullet_res.gun_shot_sound, 
									"Game SFX",
									-5, 
									randf_range(0.8, 1.2))
	
func shoot() -> void:
	## Handles creating and shooting a bullet
	if cur_ammo <= 0 and not not_reloading():
		return
	
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
		bullet.global_rotation_degrees = (rotation_degrees 
										+ randf_range(-bullet_spread, bullet_spread)
										+ (gun_res.bps_spread + ((i-1) * gun_res.bps_spread))) #if i % 2 == 0 else -gun_res.bullets_per_shot_spread))
		bullet.target_group = "Enemy"
		
		# putting bullet in fight scene
		get_parent().get_parent().add_child(bullet)
		
		shoot_sound_effect()
		cur_ammo -= 1
		GlobalSignal.emit_signal("get_cur_stats", "GUN", get_cur_stats())
	shoot_timer.start(gun_res.fire_rate)

func update_ui() -> void:
	## If selected, gun stats get the stats of current gun
	if is_selected():
		GlobalSignal.emit_signal("get_cur_stats", "GUN", get_cur_stats())
		
func get_cur_stats() -> Dictionary:
	## For giving stats globally the fight_ui can track
	return {
		"cur_ammo": cur_ammo,
		"mag_size": mag_size,
		"gun_type": gun_res.name,
		"gun_image": gun_res.texture,
		"is_reloading": not not_reloading()
	}

func _on_game_won() -> void:
	## Gun is unusable in victory screen
	gun_usable = false
	
	await GlobalScene.off_victory
	gun_usable = true
	
func reload() -> void:
	## Reloading refills the ammo in the mag
	## Either manually or automatically depending on gun_res
	#print("reloading")
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
	## Auto reload means it waits (reload_time) before mag full
	#print("Auto reload started")
	for i in range(gun_res.reload_time * 2):
		if not GlobalPlayer.power_activated: reload_timer.start(1)
		else: reload_timer.start(0.15)
	
	update_ui()
	await reload_timer.timeout
	cur_ammo = mag_size
	#print("Reload complete")
	#print("check: ", cur_ammo, " ", mag_size)

func manual_reload(manual_reload_time : float) -> void:
	## Manual reload means it adds each bullet to mag one at a time
	## (Visible in FightUI)
	while cur_ammo < mag_size:
		cur_ammo += 1
		
		if not GlobalPlayer.power_activated: reload_timer.start(manual_reload_time)
		else: reload_timer.start(manual_reload_time / 7)
		update_ui()
		await reload_timer.timeout
		#print("Reloaded 1 bullet, current ammo:", cur_ammo)

	
