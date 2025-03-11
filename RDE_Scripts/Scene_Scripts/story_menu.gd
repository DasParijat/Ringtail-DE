extends Control

@onready var FightDescText : Label = $FightDesc/Text
var selected_fight : String = "" # Get info on what fight the player is looking at from the fight buttons
var fight_res_path : String = ""
var loaded_selected_fight : LevelRes

func _process(delta: float) -> void:
	fight_res_path = "res://RDE_Resources/Level Res/" + selected_fight + ".tres"
	
	# If selected fight changes, then set description to latest valid level description
	if load(fight_res_path) and load(fight_res_path) != loaded_selected_fight:
		# Load level res to get level desc
		loaded_selected_fight = load(fight_res_path)
		#print("level desc: ", loaded_selected_fight.LEVEL_DESC)
		FightDescText.text = loaded_selected_fight.LEVEL_DESC
	
func _on_playfight_b_pressed() -> void:
	if selected_fight:
		GlobalScene.set_next_level(fight_res_path)
		GlobalScene.load_next_scene(GlobalScene.GAME)
	else:
		printerr("STORY MENU ERR: SELECTED FIGHT IS BLANK")
