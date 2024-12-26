extends Resource
class_name HealthRes

@export var max_hp : int
var cur_hp : int = max_hp

func take_dmg(dmg_amount):
	cur_hp = cur_hp - dmg_amount
