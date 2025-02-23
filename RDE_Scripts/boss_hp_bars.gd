extends CanvasLayer

@onready var base : CharacterBody2D = get_parent()

@onready var max_hp : float = -1
@onready var cur_hp : float = -1 

@export var num_of_bars : int = 1

func _on_base_mob_health_res_set() -> void:
	# Set it up so it creates (num_of_bars) progress bars
	# And the max & min is of range floor( max_hp / num_of_bars ) 
	# [ floor(max_hp/num_of_bar) - 1 for all bars but first]
	# For last bar, max size is always max_hp
	# EX: Max HP of 75, 3 bars, 1st bar range from 0 to 25, 2nd bar range from 26 to 50, 3rd bar range from 51 to 75
	# # EX: Max HP of 50, 4 bars, 1st bar range from 0 to 12, 2nd bar range from 13 to 24, 3rd bar range from 25 to 37, 4th bar range from 38 to 50
	
	max_hp = base.health_res.max_hp
	$BaseBar.max_value = max_hp
	
func _process(delta: float) -> void:
	if base.health_res.cur_hp > -1:
		update_bar($BaseBar, base.health_res.cur_hp, 0.5)

func update_bar(bar : ProgressBar, new_hp : float, rate : float) -> void:
	bar.value = new_hp
	
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_CUBIC)
	tween.set_ease(Tween.EASE_OUT)
	tween.tween_property(bar, "value", new_hp, rate)
	
