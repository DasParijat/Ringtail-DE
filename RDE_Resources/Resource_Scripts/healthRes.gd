extends Resource
class_name HealthRes
# HealthRes is used to define HP related stats and functions
# Used by any entity with health

@export var HP_NAME : String = "UNAMED HP USER"

@export var max_hp : int = 10
@export var damage_rate : float = 1 # the higher, the more damage taken per usual.
@export var invicible : bool = false

var _cur_hp : int = max_hp # Bottom-Level Var DO NOT MODIFY ELSEWHERE
var is_max_hp : bool = true

var cur_hp : int: # Top-Level
	get:
		return _cur_hp
	set(value):
		_cur_hp = clampi(value, 0, max_hp)
		is_max_hp = _cur_hp == max_hp

var iframe_timer : Timer 
var iframe_len : float

func set_health_res(timer) -> void:
	iframe_timer = timer # nodes using health res have to have their own timers
	reset_health() # reset health is seperate so it can be reset on it's own without affecting timer
	
func reset_health() -> void:
	cur_hp = max_hp
	
func take_dmg(dmg_amount : float):
	if iframe_timer.is_stopped() and not invicible:
		iframe_len = iframe_timer.wait_time
		dmg_amount = dmg_amount * damage_rate
		
		cur_hp = cur_hp - dmg_amount
		
		#print(HP_NAME, " took damage, CUR HP: ", cur_hp, 
		#"	DMG AMOUNT: ", dmg_amount) # for debugging
		
		if iframe_len >= 0.1 and dmg_amount > 0.0:
			iframe_timer.start(iframe_len)

func is_dead() -> bool:
	return cur_hp <= 0
	
