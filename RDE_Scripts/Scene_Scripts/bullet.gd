extends Area2D
	
var bullet_res : BulletRes 
var gun_res : GunRes

var bullet_travelled : float
var start_position : Vector2

func _ready():
	start_position = global_position
	look_at(get_global_mouse_position())
	
func set_bullet_res(res):
	bullet_res = res
	
func falloff_calc():
	pass
	# checks if falloff calculation should be enabled, and to do the calc if true
	#if bullet_travelled > falloff_point:
	#	damage -= falloff_rate
		
func _physics_process(delta):
	position += transform.x * gun_res.bullet_speed * delta
	bullet_travelled = global_position.distance_to(start_position)
	print(bullet_travelled)
	
	# temp test
	if bullet_travelled > 200:
		queue_free()
		
