extends Node2D

@export var gun_index: int = 0  # 0 for primary gun, 1 for secondary gun

@onready var player_res: PlayerRes = get_parent().player_res
@onready var gun_res: GunRes = player_res.gun_array[gun_index]
@onready var bullet_res: BulletRes = gun_res.bullet_res
@onready var shoot_timer: Timer = $ShootTimer

@onready var mag_size : int = gun_res.mag_size
@onready var cur_ammo : int = gun_res.cur_ammo

func _ready() -> void:
	shoot_timer.wait_time = gun_res.fire_rate  

func _process(delta: float) -> void:
	var is_auto = gun_res.is_automatic
	position = get_parent().position
	
	if can_shoot():
		if is_auto and Input.is_action_pressed("shoot"):
			shoot()
		elif not is_auto and Input.is_action_just_pressed("shoot"):
			shoot()
	
	
			
func can_shoot() -> bool:
	return shoot_timer.is_stopped()  

func shoot() -> void:
	var bullet = preload("res://RDE_Scenes/bullet.tscn").instantiate()
	print("gun script: ", bullet_res)
	bullet.bullet_res = bullet_res
	bullet.gun_res = gun_res
	
	bullet.global_transform = global_transform
	get_tree().root.add_child(bullet)

	shoot_timer.start()

func reload():
	if Input.is_action_just_pressed("reload") || cur_ammo <= 0:
		match(gun_res.reload_type):
			"AUTO":
				auto_reload()
			"MANUAL":
				var manual_reload_time = gun_res.reload_time / mag_size
				manual_reload(manual_reload_time)
			
func auto_reload():
	#add code to wait for (reload_time) until completely reloaded
	cur_ammo = mag_size 

func manual_reload(manual_reload_time):
	while cur_ammo < mag_size:
		cur_ammo += 1
		# add code to wait (manual_reload_time) between each bullet loaded
