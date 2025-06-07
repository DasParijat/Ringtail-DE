extends CanvasLayer
# TODO - Create a new menu

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Engine.time_scale = 1 # Ensures time scale is normal when menu loads
	 
	GlobalScene.cur_scene_type = GlobalScene.SceneType.MAIN_MENU
	GlobalFightStats.reset_fight_stats()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
