extends Ringtail
# HARD

@export var attack_min : int = 1
@export var attack_max : int = 3

var phase : int = 1

func _process(delta : float) -> void:
	controller.action_handling(randi_range(attack_min, attack_max))
	
	#print("PHASE: ", phase, " hp: ", mob_res.health_comp.cur_hp)
	phase = 1 + floor(
		(mob_res.health_comp.max_hp - mob_res.health_comp.cur_hp) 
		/ (mob_res.health_comp.max_hp / 3)
		)
	
	# 3 - floor((fmod(mob_res.health_comp.cur_hp, mob_res.health_comp.max_hp / 3)) / 100)
	total_delta += delta
	
	if GlobalTime.process_interval(2.0, total_delta, delta):
		hollow_projectile.shoot({"follow_target": true, "follow_target_length": 5})
		spawner.spawn_mob(explosion_load, base.global_position)
		
	if GlobalTime.process_interval(3.0, total_delta, delta):
		projectile.shoot_laser({"speed": 1000, "in_group": "NONE"}, 15)
		projectile.shoot_from_rand()
