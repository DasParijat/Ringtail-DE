extends CharacterBody2D

@onready var mob_res : MobRes = get_parent().mob_res
@onready var sprite : Sprite2D = $Sprite2D
@onready var collision : CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	sprite.texture = mob_res.texture
	position.y = 0


func _process(delta: float) -> void:
	pass
