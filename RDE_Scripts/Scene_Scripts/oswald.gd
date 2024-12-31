extends Node2D
# Oswald.gd is code specific to the Oswald playable character
# Handles getting in the oswald resource and Oswald's special power move
# MIGHT CHANGE IN FUTURE TO ONLY HANDLE OSWALD'S POWER MOVE

@export var player_res : PlayerRes 

@onready var base_player : CharacterBody2D = $base_player
@onready var primary_gun = $PrimaryGun
@onready var secondary_gun = $SecGun

var gun_index : int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#base_player.set_speedmod(2)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = base_player.position
	
	if Input.is_action_just_pressed("switch_weapon"):
		handle_gun_switch()

# TODO might move function to PlayerRes
func handle_gun_switch():
	print("switch")
	if gun_index == player_res.gun_array.size():
		gun_index = -1 #after incrementing, gun_index is back to 0
	gun_index += 1
	
	# TODO put code to handle actually switching the gun, may involve hiding/showing nodes
