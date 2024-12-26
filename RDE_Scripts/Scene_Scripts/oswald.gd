extends Node2D

@export var player_res : PlayerRes
@onready var base_player : CharacterBody2D = $base_player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#base_player.set_speedmod(2)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
