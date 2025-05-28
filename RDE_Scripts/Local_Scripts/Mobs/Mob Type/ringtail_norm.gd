extends Ringtail
# NORMAL

@export var cur_sequence : Array[int] = [1,2,3]

func _process(delta : float) -> void:
	phase_handler(2)
	total_delta += delta
	
	controller.action_sequence(cur_sequence)
	# Wish there was a traditional switch statement
	if phase >= 1:
		phase1()
	if phase >= 2:
		phase2()

func phase1():
	if total_delta < 5.0:
		return
	
	if GlobalTime.process_interval(2.0, total_delta, get_process_delta_time()):
		match(phase):
			1: projectile.shoot_from_rand()
			2: projectile.shoot_laser({"speed": 750}, 4, 0.4)
		
	if GlobalTime.process_interval(3.0, total_delta, get_process_delta_time()):
		match(phase):
			1: target_projectile.shoot({"speed": 1400})
			2: target_projectile.shoot({"speed": 2100})
	
	if GlobalTime.process_interval(4.0, total_delta, get_process_delta_time()):
		for i in range(phase + 1):
			spawner.spawn_mob(minitail_default, base.global_position)

func phase2():
	cur_sequence = [1,2,3,4,6]
	
	if GlobalTime.process_interval(3.0, total_delta, get_process_delta_time()):
		hollow_projectile.shoot({"follow_target": true, "follow_target_length": 8})
		
	if GlobalTime.process_interval(10.0, total_delta, get_process_delta_time()):
		spawner.spawn_mob(explosion_load, base.get_rand_player_pos(25, 50, 25, 50))
	
	if GlobalTime.process_interval(((phase - 1) * 15.0), total_delta, get_process_delta_time()):
		if randi_range(0,4) == 0:
			for i in randi_range(1,3):
				spawner.spawn_mob(minitail_heavy, base.global_position)
		else:
			spawner.spawn_mob(minitail_speed, base.global_position)
