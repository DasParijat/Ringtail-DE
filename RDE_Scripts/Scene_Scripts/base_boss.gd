extends CharacterBody2D

@onready var mob_res : MobRes = get_parent().mob_res
@onready var sprite : Sprite2D = $Sprite2D
@onready var collision : CollisionShape2D = $CollisionShape2D
@onready var hitbox : CollisionShape2D = $HitBox/CollisionShape2D

var target_vector : Vector2
var player_vector : Vector2 

func _ready() -> void:
	sprite.texture = mob_res.texture
	position.y = -100
	
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))


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

func _on_get_cur_stats(type, stats):
	if type == "PLAYER":
		pass # TODO Set up code to track player position, 
			 # but with delay (so mob doesn't instantly know where player is) 
