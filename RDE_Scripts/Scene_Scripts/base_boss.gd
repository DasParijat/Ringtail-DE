extends CharacterBody2D

@onready var mob_res : MobRes = get_parent().mob_res
@onready var sprite : Sprite2D = $Sprite2D

@export var sprite_texture_path : String = "res://RDE_Images/nf Player.png"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
