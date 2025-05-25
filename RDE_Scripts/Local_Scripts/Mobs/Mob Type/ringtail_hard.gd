extends Ringtail
# HARD

@export var attack_min : int = 1
@export var attack_max : int = 4

func _process(delta : float) -> void:
	phase_handler(3)
	total_delta += delta
	
	controller.action_handling(randi_range(attack_min, attack_max))
	# Wish there was a traditional switch statement
	if phase >= 1:
		phase1()
	if phase >= 2:
		attack_max = 4
		phase2()
	if phase >= 3:
		phase3()


func phase1():
	if GlobalTime.process_interval(3.0, total_delta, get_process_delta_time()):
		#hollow_projectile.shoot({"follow_target": true, "follow_target_length": 5})
		if phase == 1:
			target_projectile.shoot({"speed": 1400})
		else:
			target_projectile.shoot({"speed": 2100})
		
	if GlobalTime.process_interval(2.0, total_delta, get_process_delta_time()):
		projectile.shoot_from_rand()
	
	if GlobalTime.process_interval(4.0, total_delta, get_process_delta_time()):
		for i in range(phase * 2):
			spawner.spawn_mob(minitail_default, base.global_position)

func phase2():
	attack_max = 5
	if GlobalTime.process_interval(3.0, total_delta, get_process_delta_time()):
		hollow_projectile.shoot({"follow_target": true, "follow_target_length": 5})
	
	if GlobalTime.process_interval(8.0, total_delta, get_process_delta_time()):
		if randi_range(0,1) == 0:
			spawner.spawn_mob(minitail_speed, base.global_position)
		
	if GlobalTime.process_interval(10.0, total_delta, get_process_delta_time()):
		spawner.spawn_mob(explosion_load, base.player_pos)
	
func phase3():
	attack_max = 6
		
	if GlobalTime.process_interval(20.0, total_delta, get_process_delta_time()):
		for i in randi_range(1,3):	
			spawner.spawn_mob(minitail_shield, base.global_position)
