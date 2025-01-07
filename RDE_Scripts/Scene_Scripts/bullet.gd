extends Area2D

@onready var gun_res : GunRes
@onready var bullet_res : BulletRes 
@onready var damage : float = bullet_res.damage
@onready var texture : Texture2D = bullet_res.texture
@onready var sprite = $Sprite2D

var bullet_travelled : float
var start_position : Vector2
var direction : Vector2  

func _ready():
	#bullet_res = bullet_res.duplicate()
	start_position = global_position
	sprite.texture = texture
	direction = Vector2.RIGHT.rotated(rotation).normalized()
	
func set_bullet_res(res):
	bullet_res = res
	
func falloff_calc():
	# checks if falloff calculation should be enabled, and to do the calc if true
	if bullet_travelled > bullet_res.falloff_point:
		damage -= bullet_res.falloff_rate
		#print("bulscript, falloff calc: ", damage)
		
func _physics_process(delta):
	position += transform.x * gun_res.bullet_speed * delta
	bullet_travelled = global_position.distance_to(start_position)
	falloff_calc()
	
	# temp test
	if damage < 0:
		queue_free()

func _on_tree_exiting() -> void:
	queue_free()
