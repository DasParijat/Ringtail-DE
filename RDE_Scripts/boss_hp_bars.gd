extends CanvasLayer

@onready var base : CharacterBody2D = get_parent()
@onready var health_res : HealthRes = base.health_res

#@onready var max_hp : float = health_res.max_hp
#@onready var cur_hp : float = health_res.cur_hp

@export var num_of_bars : int = 1

func _ready() -> void:
	# Set it up so it creates (num_of_bars) progress bars
	# And the max & min is of range floor( max_hp / num_of_bars ) 
	# [ floor(max_hp/num_of_bar) - 1 for all bars but first]
	# For last bar, max size is always max_hp
	# EX: Max HP of 75, 3 bars, 1st bar range from 0 to 25, 2nd bar range from 26 to 50, 3rd bar range from 51 to 75
	# # EX: Max HP of 50, 4 bars, 1st bar range from 0 to 12, 2nd bar range from 13 to 24, 3rd bar range from 25 to 37, 4th bar range from 38 to 50 
	pass 

	# left here for basic test
	#$BaseBar.max_value = max_hp

func _process(delta: float) -> void:
	pass
	#$BaseBar.value = cur_hp
	
