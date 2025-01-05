extends CharacterBody2D

@onready var mob_res : MobRes = get_parent().mob_res
@onready var sprite : Sprite2D = $Sprite2D
@onready var collision : CollisionShape2D = $CollisionShape2D
@onready var hitbox : CollisionShape2D = $HitBox/CollisionShape2D

func _ready() -> void:
	sprite.texture = mob_res.texture
	position.y = 0


func _physics_process(delta: float) -> void:
	pass
	
func test_mobAI_code():
	# Credit to Eli Cuaycong for basic mob AI
	# Using it as base and example
	
	var player = get_parent().get_node("Fight").player_scene
	# concept code, not final code for retrieving player node
	
	position += (player.position - position) / 50
	look_at(player)
	
	move_and_slide()
