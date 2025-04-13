extends Ringtail

@export var attack_min : int = 1
@export var attack_max : int = 3

func _process(delta: float) -> void:
	controller.action_handling(randi_range(attack_min, attack_max))
	
	total_delta += delta
	
	if GlobalTime.process_interval(1.0, total_delta, delta):
		shoot_attack.shoot({"follow_target": true, "follow_target_length": 5})
		
	if GlobalTime.process_interval(3.0, total_delta, delta):
		shoot_attack.shoot_laser({"speed": 1000, "in_group": "NONE"}, 10)
		shoot_attack.shoot_from_rand()
