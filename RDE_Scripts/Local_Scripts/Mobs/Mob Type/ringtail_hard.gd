extends Ringtail
# HARD

@export var attack_min : int = 1
@export var attack_max : int = 3

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
	if GlobalTime.process_interval(2.0, total_delta, get_process_delta_time()):
		hollow_projectile.shoot({"follow_target": true, "follow_target_length": 5})
	
	if GlobalTime.process_interval(3.0, total_delta, get_process_delta_time()):
		projectile.shoot_laser({"speed": 1000, "in_group": "NONE"}, 15)
	
	if GlobalTime.process_interval(1.0, total_delta, get_process_delta_time()):
		spawner.spawn_mob(minitail_aim, base.get_rand_player_pos(0, 100, 0, 100))
		#for i in range(phase * 2):
		#	spawner.spawn_mob(minitail_default, base.global_position)

func phase2():
	if GlobalTime.process_interval(3.0, total_delta, get_process_delta_time()):
		projectile.shoot_from_rand()
		
	if GlobalTime.process_interval(1.0, total_delta, get_process_delta_time()):
		spawner.spawn_mob(explosion_load, base.player_pos)
		
	if GlobalTime.process_interval(10.0, total_delta, get_process_delta_time()):
		spawner.spawn_mob(minitail_shield, base.global_position)
	
func phase3():
	if GlobalTime.process_interval(8.0, total_delta, get_process_delta_time()):
		spawner.spawn_mob(minitail_speed, base.global_position)
