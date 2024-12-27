extends Area2D

@onready var player_res : PlayerRes = get_parent().player_res

var gun_res = player_res.primary_gun
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
