extends Resource
class_name HealthRes
# HealthRes is used to define HP related stats and functions
# Used by any entity with health

@export var max_hp : int
var cur_hp : int = max_hp

var iframe_timer : Timer 
var iframe_len : float = 0

var invicible : bool = false
var damage_rate : float = 1 # the higher, the more damage taken per usual.

func set_health_res(timer) -> void:
	iframe_timer = timer # nodes using health res have to have their own timers
	reset_health() # reset health is seperate so it can be reset on it's own without affecting timer
	
func reset_health() -> void:
	cur_hp = max_hp
	
func take_dmg(dmg_amount : float):
	if not invicible:
		cur_hp = cur_hp - (dmg_amount * damage_rate)
		print("took damage, hp: ", cur_hp) # for debugging
		
		iframe_timer.start(iframe_len)

func is_dead() -> bool:
	return cur_hp <= 0
	
