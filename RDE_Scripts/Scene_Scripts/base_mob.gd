extends CharacterBody2D

@onready var mob_res : MobRes = get_parent().mob_res
@onready var pos_track_delay : float = mob_res.pos_track_delay

@onready var sprite : Sprite2D = $Sprite2D
@onready var player_track : Timer = $PlayerTrackDelay
@onready var collision : CollisionShape2D = $CollisionShape2D
@onready var hitbox : CollisionShape2D = $HitBox/CollisionShape2D

var target_pos : Vector2 = Vector2(0, 0)
var player_pos : Vector2 

func _ready() -> void:
	sprite.texture = mob_res.texture
	position.y = -100
	
	GlobalSignal.connect("get_cur_stats", Callable(self, "_on_get_cur_stats"))


func _physics_process(delta: float) -> void:
	test_mobAI_code(delta)
	
func test_mobAI_code(delta):
	track_pos(player_pos, 0)
	look_at(target_pos)
	position += transform.x * 300 * delta
	print("target pos: ", target_pos, "cur pos: ", position)
	# TODO fix up movement
	
	#move_and_slide()

func track_pos(cur_data, delay) -> void:
	if player_track.is_stopped(): # and (target_pos != cur_data):
		target_pos = cur_data
		player_track.start(delay)
		
func _on_get_cur_stats(type, stats):
	if type == "PLAYER":
		player_pos = stats["position"]
