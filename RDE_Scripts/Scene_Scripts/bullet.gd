extends Area2D
	
var bullet_res : BulletRes 
var gun_res : GunRes

func _ready():
	look_at(get_global_mouse_position())
	
func set_bullet_res(res):
	bullet_res = res

func _physics_process(delta):
	position += transform.x * gun_res.bullet_speed * delta
