extends Timer

@export var print_runtime : bool = false

var total_runtime_seconds : float = 0.0
var total_runtime_string : String 

func _ready() -> void:
	# TODO - Add code to retrieve runtime from save data 
	pass

func _on_timeout() -> void:
	total_runtime_seconds += wait_time
	total_runtime_string = GlobalTime.get_time_format(total_runtime_seconds)
	
	if print_runtime: print("RUNTIME: ", total_runtime_string)

func _on_tree_exiting() -> void:
	# TODO - Add code to save total runtime before closing game
	pass
