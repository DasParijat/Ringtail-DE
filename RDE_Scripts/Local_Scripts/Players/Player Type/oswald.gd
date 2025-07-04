extends Node2D
# Oswald.gd is code specific to the Oswald playable character
# Handles getting in the oswald resource and Oswald's special power move

@export var player_res : PlayerRes = preload("res://RDE_Resources/Player Res/Oswald.tres")

@export var base : BasePlayer 
@export var gun_array : Array[PlayerGun]
@export var switch_timer : Timer
@export var auto_power_timer : Timer

var cur_gun : PlayerGun
var next_gun : PlayerGun

var gun_index : int = 0

func _ready() -> void:
	#print("oswald added")
	#print("global pos: ", global_position, "	pos: ", position)
	GlobalSignal.cur_gun.emit(gun_array[0].gun_res) # makes sure camera gets primary gun_res first

func _process(_delta : float) -> void:
	position = base.position
	if GlobalTime.is_paused or GlobalScene.on_victory_screen:
		return
	
	cur_gun = gun_array[gun_index]
	next_gun = gun_array[player_res.get_next_gun_index(gun_index)]
	
	base.cur_gun_weight = cur_gun.gun_res.weight
	
	gun_index = player_res.handle_gun_switch(gun_index, switch_timer, next_gun.gun_res.switch_sound)
	
	if (player_res.health_res.cur_hp < (player_res.health_res.max_hp / 5) * 1.5 #player_res.cur_power > player_res.power_ex_cutoff 
			and not cur_gun.not_reloading()
			and Input.is_action_just_pressed("shoot")):
		gun_index = player_res.get_next_gun_index(gun_index)
		AudioManager.play_audio_one_shot(next_gun.gun_res.switch_sound)
			
	power_move()

func power_move() -> void:
	## this power move logic is EXCLUSIVE to oswald
	GlobalPlayer.power_activated = is_power_activated()
	
	# power move itself
	if GlobalPlayer.power_activated:
		auto_power_timer.start()
		base.set_speedmod(2.5)
		player_res.health_res.damage_rate = 0.2
		GlobalTime.cur_time_scale = 0.2
		
		if player_res.health_res.cur_hp < 1.5:
			## When in power, prevents player from dying during so
			player_res.health_res.cur_hp = 1.5
		
		if GlobalScene.on_victory_screen:
			GlobalPlayer.power_activated = false
		
		player_res.cur_power -= 0.1
	else:
		GlobalTime.cur_time_scale = 1
		player_res.health_res.damage_rate = 1
		base.set_speedmod(1)

func is_power_activated() -> bool:
	## Handling conditions for power_activated
	return (
		(
			# Never do power under these cirumstances
			not GlobalScene.on_victory_screen and not GlobalTime.is_paused
		)
			and
		(
			# Power can be activated and maintained under these condtions
			player_res.cur_power > 3 
			or (GlobalPlayer.power_activated and player_res.cur_power > 0)
		)
			and
		(
		# Input for turning on power manually
		Input.is_action_pressed("sprint") 
		or (base.is_near_enemy # auto-power when low on health and near enemy
			#and player_res.cur_power > player_res.power_ex_cutoff 
			and player_res.health_res.cur_hp < (player_res.health_res.max_hp / 5) * 1.5
			and auto_power_timer.is_stopped()
			and GlobalPlayer.is_moving)
		) 
		or (base.is_near_enemy # If player stops holding power, keep power if near enemy
			and GlobalPlayer.power_activated)
			and player_res.cur_power > 0
	) 
	

func _on_tree_exiting() -> void:
	#print("oswald exit")
	pass
