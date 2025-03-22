extends Node2D
# Oswald.gd is code specific to the Oswald playable character
# Handles getting in the oswald resource and Oswald's special power move
# MIGHT CHANGE IN FUTURE TO ONLY HANDLE OSWALD'S POWER MOVE

@export var player_res : PlayerRes 

@onready var base : CharacterBody2D = $base_player
@onready var primary_gun = $PrimaryGun
@onready var secondary_gun = $SecGun
@onready var switch_timer = $GunSwitchTimer

var gun_index : int = 0

func _ready() -> void:
	player_res.cur_power = player_res.max_power
	
	print("oswald added")
	GlobalSignal.cur_gun.emit(primary_gun.gun_res) # makes sure cam gets primary gun_res first
	# print(cur_power)


func _process(delta: float) -> void:
	position = base.position
	
	#print(base.position)
	gun_index = player_res.handle_gun_switch(gun_index, switch_timer)
	#print("ENGINE TIME	", Engine.time_scale)
	
	#player_res.health_comp.take_dmg(0.01)
	#print(player_res.health_comp.cur_hp)
	power_move()

func power_move() -> void:
	# this power move logic is EXCLUSIVE to oswald
	if player_res.cur_power > 0.1 and GlobalPlayer.power_activated and not GlobalTime.is_paused:
		base.set_speedmod(1.5) 
		GlobalTime.cur_time_scale = 0.3 

		#print(GlobalTime.cur_time_scale)
		player_res.cur_power -= 0.1
	else:
		GlobalTime.cur_time_scale = 1
		base.set_speedmod(1)
	


func _on_tree_exiting() -> void:
	print("oswald exit")
