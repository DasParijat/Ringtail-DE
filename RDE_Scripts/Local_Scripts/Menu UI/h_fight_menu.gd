class_name FightMenu
extends Control

@export var fight_buttons : Container
@export var PlayButton : Button

@export var fight_thumbnail : TextureRect
@export var fight_header : Label
@export var fight_desc : Label

var selected_fight : String = "" # Get info on what fight the player is looking at from the fight buttons
var fight_res_path : String = ""

var new_selected_fight : LevelRes
var loaded_selected_fight : LevelRes

var loaded_fights : Dictionary = {}  

var anim_rate : float = 0.2

func _ready() -> void:
	GlobalMenu.connect("fight_selected_pressed", Callable(self, "_on_fight_selected_pressed"))
	load_all_fight_resources()
	PlayButton.disabled = true
	
	hide()
	modulate.a = 0

func enter_animation() -> void:
	show()
	var tween = create_tween()
	tween.set_parallel(true)
	
	tween.tween_property(self, "modulate:a", 1, anim_rate)

func exit_animation() -> void:
	var tween = create_tween()
	tween.set_parallel(true)
	
	tween.tween_property(self, "modulate:a", 0, anim_rate)
	await tween.finished
	hide()

func load_all_fight_resources() -> void:
	loaded_fights.clear()
	
	for button in fight_buttons.get_children():
		if button.has_method("get_fight_type") and not button.is_locked:
			var fight_type = button.fight_type
			var res_path = "res://RDE_Resources/Level Res/" + fight_type + ".tres"
			loaded_fights[fight_type] = load(res_path)
			
	#print("loaded fights: ", loaded_fights.keys())

func _on_fight_selected_pressed(fight_type) -> void:
	if fight_type in loaded_fights:
		PlayButton.disabled = false # undisable play button when valid fight type
		
		new_selected_fight = loaded_fights[fight_type]
		selected_fight = fight_type
		fight_res_path = "res://RDE_Resources/Level Res/" + fight_type + ".tres"

	if new_selected_fight != loaded_selected_fight:
		loaded_selected_fight = new_selected_fight
		
		fight_desc.text = loaded_selected_fight.LEVEL_DESC
		fight_header.text = loaded_selected_fight.DISPLAY_NAME
		fight_thumbnail.texture = loaded_selected_fight.THUMBNAIL

func _on_playB_pressed() -> void:
	if selected_fight:
		GlobalScene.set_next_level(fight_res_path)
		await exit_animation()
		GlobalScene.load_next_scene(GlobalScene.GAME)
	else:
		printerr("STORY MENU ERR: SELECTED FIGHT IS BLANK")

func _on_backB_pressed() -> void:
	GlobalMenu.emit_signal("menu_change", "MAIN")
	await exit_animation()
