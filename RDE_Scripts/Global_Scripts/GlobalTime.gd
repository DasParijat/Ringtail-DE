extends Node

var is_paused : bool = false
var photo_enabled : bool = false # For photo mode

var game_time_scale : float = 1 
# game_time_scale is what determines the pace of every game object (including pausing)	
var cur_time_scale : float = 1
# cur_time_scale is used so in-game slow motion effects don't affect pausing

func local_wait(seconds : float) -> Signal:
	## Creates timer and waits until timeout
	## Always use 'await' with this func
	#print(seconds)
	return get_tree().create_timer(seconds).timeout

func process_interval(interval_time : float, total_delta : float, delta : float) -> bool:
	## Every (interval_time), return true
	return fmod(total_delta, interval_time) < delta

func get_time_format(f_seconds : float) -> String:
	## Returns given float-type seconds in 0:00 format
	# DOES NOT HANDLE HOURS (yet)
	var i_second : int = floor(f_seconds)
	return "%d:%02d" % [floor(i_second / 60), i_second % 60]
