extends Resource
class_name HealthRes
# HealthRes is used to define HP related stats and functions
# Used by any entity with health

@export var max_hp : int
var cur_hp : int = max_hp

var iframe_timer : Timer = Timer.new()
var iframe_len : float

var invicible : bool = false
var damage_rate : float = 1 # the higher, the more damage taken per usual.

func reset_health() -> void:
	cur_hp = max_hp
	
func take_dmg(dmg_amount):
	if iframe_timer.is_stopped() and not invicible:
		cur_hp = cur_hp - (dmg_amount * damage_rate)
		print("took damage, hp: ", cur_hp) # for debugging
		
		iframe_timer.start(iframe_len)
		
# TODO set health limiter so it doesn't go under 0, 
#		or at least a function to detect that and make player quit game
