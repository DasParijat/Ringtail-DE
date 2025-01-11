extends CharacterBody2D

@onready var mob_res : MobRes = get_parent().mob_res
@onready var pos_track_delay : float = mob_res.pos_track_delay

@onready var sprite : Sprite2D = $Sprite2D
@onready var player_track : Timer = $PlayerTrackDelay
@onready var collision : CollisionShape2D = $CollisionShape2D
@onready var hitbox : CollisionShape2D = $HitBox/CollisionShape2D

var target_vector : Vector2
var player_pos : Vector2 

func _ready() -> void:
	sprite.texture = mob_res.texture
	position.y = -100
	
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))


func _physics_process(delta: float) -> void:
	test_mobAI_code()
	
func test_mobAI_code():
	# Credit to Eli Cuaycong for basic mob AI
	# Using it as base and example
	
	position += (player_pos - position) / 10
	look_at(player_pos)
	
	move_and_slide()

# TODO seperate tracking to it's own function, so it can be applied to any pos
func _on_get_cur_stats(type, stats):
	if type == "PLAYER":
		if player_track.is_stopped():
			player_pos = stats["position"]
			player_track.start(2)
