extends Node2D
# Oswald.gd is code specific to the Oswald playable character
# Handles getting in the oswald resource and Oswald's special power move
# MIGHT CHANGE IN FUTURE TO ONLY HANDLE OSWALD'S POWER MOVE

@export var player_res : PlayerRes 

@onready var base_player : CharacterBody2D = $base_player
@onready var primary_gun = $PrimaryGun
@onready var secondary_gun = $SecGun
@onready var switch_timer = $GunSwitchTimer

var gun_index : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#base_player.set_speedmod(2)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = base_player.position
	
	gun_index = player_res.handle_gun_switch(gun_index, switch_timer)
		
func can_switch() -> bool:
	return switch_timer.is_stopped()
