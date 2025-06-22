extends Node2D

var cutscene_res : CutsceneRes

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_game_cutscene_res_set() -> void:
	cutscene_res = get_parent().cutscene_res
	
	if get_child_count() > 0:
		for child in get_children():
			child.queue_free()
	
	var cutscene = cutscene_res.base_cutscene
	
	add_child(cutscene.instantiate())
