extends Timer

@export var print_runtime : bool = false

var total_runtime_seconds : float = 0.0
var total_runtime_string : String 

func _on_timeout() -> void:
	total_runtime_seconds += wait_time
	total_runtime_string = GlobalTime.get_time_format(total_runtime_seconds)
	
	if print_runtime: print("RUNTIME: ", total_runtime_string)

func _on_tree_exiting() -> void:
	# Make sure runtime is saved before closing game
	GlobalSave.set_runtime()
