extends Ringtail

@export var attack_min : int = 1
@export var attack_max : int = 3

# ATTACK PLAN
# PHYSICAL
# Follow player
# Dash to last player position (0.2s~ distance)
# Dash to opposite of last player position
# Dash to random places 
# Follow and teleport when hits player
# Point and launch towards player (then teleport somewhere else)

# MAGIC
# Random triangle bullets (like with obignale and darius)
# Explosion thing
# Tracking triangles (will follow player for a bit before just going straight)
# Chain explosion thing
# Laser triangles (series of triangles towards player)
# Targeting triangles (triangles circle around player)

func _process(delta: float) -> void:
	controller.action_handling(randi_range(attack_min, attack_max))
	pass
