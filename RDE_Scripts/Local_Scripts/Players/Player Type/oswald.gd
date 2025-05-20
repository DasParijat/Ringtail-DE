extends Node2D
# Oswald.gd is code specific to the Oswald playable character
# Handles getting in the oswald resource and Oswald's special power move

@export var player_res : PlayerRes = preload("res://RDE_Resources/Player Res/Oswald.tres")

@export var base : BasePlayer 
@export var gun_array : Array[PlayerGun]
@export var switch_timer : Timer

var cur_gun : PlayerGun
var next_gun : PlayerGun

var gun_index : int = 0

func _ready() -> void:
	#print("oswald added")
	GlobalSignal.cur_gun.emit(gun_array[0].gun_res) # makes sure camera gets primary gun_res first

func _process(delta: float) -> void:
	position = base.position
	if GlobalTime.is_paused:
		return
		
	#if not GlobalPlayer.power_activated:
	#	gun_index = player_res.handle_gun_switch(gun_index, switch_timer)
	
	cur_gun = gun_array[gun_index]
	next_gun = gun_array[player_res.get_next_gun_index(gun_index)]
	
	gun_index = player_res.handle_gun_switch(gun_index, switch_timer)
	
	if (player_res.cur_power > player_res.power_ex_cutoff 
			and not cur_gun.not_reloading()
			and Input.is_action_just_pressed("shoot")):
		gun_index = player_res.get_next_gun_index(gun_index)
			
	power_move()

func power_move() -> void:
	## this power move logic is EXCLUSIVE to oswald
	# Handling conditions for power_activated
	GlobalPlayer.power_activated = (
		(
		Input.is_action_pressed("sprint") 
		or (base.is_near_enemy 
			and player_res.cur_power > player_res.power_ex_cutoff 
			and player_res.health_res.cur_hp < 15
			and GlobalPlayer.is_moving)
		) 
		or (base.is_near_enemy
			and GlobalPlayer.power_activated)
		and not GlobalTime.is_paused and player_res.cur_power > 1 
	)
	
	# power move itself
	if GlobalPlayer.power_activated:
		base.set_speedmod(1.5) 
		GlobalTime.cur_time_scale = 0.3 
		
		if 1 == 0: #cur_gun.cur_ammo <= 0:
			print("!! auto-switch")
			gun_index = 1 #player_res.get_next_gun_index(gun_index)
			
		player_res.cur_power -= 0.1
	else:
		GlobalTime.cur_time_scale = 1
		base.set_speedmod(1)
		
func _on_tree_exiting() -> void:
	#print("oswald exit")
	pass
