extends Node2D
# Oswald.gd is code specific to the Oswald playable character
# Handles getting in the oswald resource and Oswald's special power move

@export var player_res : PlayerRes = preload("res://RDE_Resources/Player Res/Oswald.tres")

@export var base : BasePlayer 
@export var primary_gun : PlayerGun
@export var secondary_gun : PlayerGun
@export var switch_timer : Timer

var gun_index : int = 0

func _ready() -> void:
	player_res.cur_power = player_res.max_power
	
	print("oswald added")
	GlobalSignal.cur_gun.emit(primary_gun.gun_res) # makes sure camera gets primary gun_res first

func _process(delta: float) -> void:
	position = base.position
	
	gun_index = player_res.handle_gun_switch(gun_index, switch_timer)
	power_move()

func power_move() -> void:
	# this power move logic is EXCLUSIVE to oswald
	if player_res.cur_power > 0.1 and GlobalPlayer.power_activated and not GlobalTime.is_paused:
		base.set_speedmod(1.5) 
		GlobalTime.cur_time_scale = 0.3 

		player_res.cur_power -= 0.1
	else:
		GlobalTime.cur_time_scale = 1
		base.set_speedmod(1)
	
func _on_tree_exiting() -> void:
	print("oswald exit")
