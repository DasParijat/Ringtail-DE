extends Ringtail
# EASY

@export var cur_sequence : Array[int] = [1,2,3]

func _process(delta : float) -> void:
	total_delta += delta
	
	controller.action_sequence(cur_sequence)
	phase1() # RingtailEASY only has 1 phase


func phase1():
	if base.health_res.cur_hp >= 90:
		return
	
	if GlobalTime.process_interval(2.0, total_delta, get_process_delta_time()):
		for i in randi_range(1,3):
			projectile.shoot_from_rand()
	
	if GlobalTime.process_interval(3.0, total_delta, get_process_delta_time()):
		for i in randi_range(1,2):
			target_projectile.shoot({"speed": 1500})
	
	if GlobalTime.process_interval(4.0, total_delta, get_process_delta_time()):
		for i in randi_range(1,3):
			spawner.spawn_mob(minitail_default, base.global_position)
