extends Ringtail
# NORMAL

@export var attack_min : int = 1
@export var attack_max : int = 2

func _process(delta: float) -> void:
	#controller.action_handling(randi_range(attack_min, attack_max))
	
	total_delta += delta
	
	if GlobalTime.process_interval(2.0, total_delta, delta):
		#hollow_projectile.shoot({"follow_target": true, "follow_target_length": 5})
		pass
		
	if GlobalTime.process_interval(0.5, total_delta, get_process_delta_time()):
		#spawner.spawn_mob(explosion_load, base.player_pos)
		pass
