extends Node2D

# Fight node will load the player and boss scenes at the start of a fight.
# it will load based on what LevelRes gives it
@onready var player_scene : Node2D
@onready var boss_scene : Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
