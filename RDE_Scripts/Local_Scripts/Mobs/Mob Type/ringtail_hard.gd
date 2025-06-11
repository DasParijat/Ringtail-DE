extends Ringtail
# HARD

@export var cur_sequence : Array[int] = [1,2,3,4,7]

func _process(delta : float) -> void:
	phase_handler(3)
	total_delta += delta
	
	controller.action_sequence(cur_sequence)
	# Wish there was a traditional switch statement
	if phase >= 1:
		phase1()
	if phase >= 2:
		phase2()
	if phase >= 3:
		phase3()

func phase1():
	if total_delta < 3.0 and base.health_res.cur_hp > 350:
		return
		
	if GlobalTime.process_interval(3.0, total_delta, get_process_delta_time()):
		if phase == 1:
			target_projectile.shoot({"speed": 1400})
		else:
			target_projectile.shoot({"speed": 2100})
		
	if GlobalTime.process_interval(2.0, total_delta, get_process_delta_time()):
		match(phase):
			1: projectile.shoot_from_rand()
			2: projectile.shoot_laser({"speed": 700}, 3, 0.3)
	
	if GlobalTime.process_interval(4.0, total_delta, get_process_delta_time()):
		for i in range(phase + 1):
			spawner.spawn_mob(minitail_default, base.global_position)

func phase2():
	cur_sequence = [1,2,3,4,6,7]
	
	if GlobalTime.process_interval(3.0, total_delta, get_process_delta_time()):
		for i in range(1 + phase):
			hollow_projectile.shoot_from_rand({"follow_target": true, "follow_target_length": 5})
		
	if GlobalTime.process_interval(10.0, total_delta, get_process_delta_time()):
		if phase == 2:
			spawner.spawn_mob(explosion_load, base.get_rand_player_pos(20, 40, 20, 40))
		else:
			chain_explosion(randi_range(10, 20), 0.4)
			
	if GlobalTime.process_interval(((phase - 1) * 15.0), total_delta, get_process_delta_time()):
		if randi_range(0,3) == 0:
			for i in randi_range(1,(phase - 1)):
				spawner.spawn_mob(minitail_heavy, base.global_position)
		else:
			for i in randi_range(1,phase):
				spawner.spawn_mob(minitail_speed, base.global_position)
			
func phase3():
	cur_sequence = [1,1,2,2,7,3,3,4,6,7]
	
	if GlobalTime.process_interval(18.0, total_delta, get_process_delta_time()):
		projectile.shoot_laser({"follow_target": true, 
								"follow_target_length": 3, 
								"position": Vector2(0, 10), 
								"speed": 550}
								, 7, 0.3)
	
	if GlobalTime.process_interval(15.0, total_delta, get_process_delta_time()):
		for i in randi_range(1,3):
			spawner.spawn_mob(minitail_shield, base.global_position)
