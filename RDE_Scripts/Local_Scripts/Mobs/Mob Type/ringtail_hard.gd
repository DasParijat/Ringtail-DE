extends Ringtail

@export var attack_min : int = 1
@export var attack_max : int = 3

func _process(delta : float) -> void:
	controller.action_handling(randi_range(attack_min, attack_max))
	
	total_delta += delta
	
	if GlobalTime.process_interval(2.0, total_delta, delta):
		hollow_projectile.shoot({"follow_target": true, "follow_target_length": 5})
		spawner.spawn_mob(explosion_load, base.player_pos)
		
	if GlobalTime.process_interval(3.0, total_delta, delta):
		projectile.shoot_laser({"speed": 1000, "in_group": "NONE"}, 10)
		projectile.shoot_from_rand()
