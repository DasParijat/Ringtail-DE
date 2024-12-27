extends Resource
class_name HealthRes
# HealthRes is used to define HP related stats and functions
# Used by any entity with health

@export var max_hp : int
var cur_hp : int = max_hp

func take_dmg(dmg_amount):
	cur_hp = cur_hp - dmg_amount
