extends Node

var is_paused : bool = false

var game_time_scale : float = 1 
# game_time_scale is what determines the pace of every game object (including pausing)	
var cur_time_scale : float = 1
# cur_time_scale is used so in-game slow motion effects don't affect pausing

func local_wait(seconds : float) -> Signal:
	## Always use 'await' with this func
	#print(seconds)
	return get_tree().create_timer(seconds).timeout

func process_interval(interval_time : float, total_delta : float, delta : float) -> bool:
	return fmod(total_delta, interval_time) < delta
