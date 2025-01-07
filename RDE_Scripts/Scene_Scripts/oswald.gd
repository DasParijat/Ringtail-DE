extends Node2D
# Oswald.gd is code specific to the Oswald playable character
# Handles getting in the oswald resource and Oswald's special power move
# MIGHT CHANGE IN FUTURE TO ONLY HANDLE OSWALD'S POWER MOVE

@export var player_res : PlayerRes 

@onready var base_player : CharacterBody2D = $base_player
@onready var primary_gun = $PrimaryGun
@onready var secondary_gun = $SecGun
@onready var switch_timer = $GunSwitchTimer

@onready var cur_power = player_res.cur_power

var gun_index : int = 0

func _ready() -> void:
	cur_power = player_res.max_power
	
	GlobalSignal.cur_gun.emit(primary_gun.gun_res) # makes sure cam gets primary gun_res first
	# print(cur_power)


func _process(delta: float) -> void:
	position = base_player.position
	gun_index = player_res.handle_gun_switch(gun_index, switch_timer)
	
	#player_res.health_comp.take_dmg(0.01)
	#print(player_res.health_comp.cur_hp)
	# power stuff
	player_res.power_limiters()
	power_move()
	
func power_move() -> void:
	# this power move logic is EXCLUSIVE to oswald
	if cur_power > 0.1 and Input.is_action_pressed("sprint"):
		base_player.set_speedmod((2 * (cur_power / 100)) + 1) # lower cur power results in less speed
		Engine.time_scale = 1 - ((cur_power / 100) * 0.8) + 0.2
		cur_power -= 0.1
	else:
		base_player.set_speedmod(1)
	
