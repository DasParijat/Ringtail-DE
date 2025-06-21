extends Node
# Handles values related to all mobs in game
# Currently, it just tracks num of mobs and puts a limit on how much in one scene

const MOB_LIMIT : int = 10 # includes boss itself, certain spawns can override limit (Ex. Explosion)

var num_of_mobs : int = 0
var num_of_bosses : int = 0

var global_mob_id : int = 0
var boss_queue : Array = []

var prev_main_boss : int = 0

func get_mob_id() -> int:
	global_mob_id += 1
	return global_mob_id
