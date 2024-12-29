extends Area2D

@onready var gun_res : GunRes
@onready var bullet_res : BulletRes 

var bullet_travelled : float
var start_position : Vector2

func _ready():
	start_position = global_position
	look_at(get_global_mouse_position())
	
func set_bullet_res(res):
	bullet_res = res
	
func falloff_calc():
	# checks if falloff calculation should be enabled, and to do the calc if true
	if bullet_travelled > bullet_res.falloff_point:
		bullet_res.damage -= bullet_res.falloff_rate
		print(bullet_res.damage)
		
func _physics_process(delta):
	position += transform.x * gun_res.bullet_speed * delta
	bullet_travelled = global_position.distance_to(start_position)
	falloff_calc()
	
	# temp test
	if bullet_res.damage < 0:
		queue_free()
		
