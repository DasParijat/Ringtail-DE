extends AudioStreamPlayer
# Music Player

var fight_res

var song_intro : AudioStream
var song_body : AudioStream
var song_outro : AudioStream

func _ready() -> void:
	pass
	
func _on_game_fight_res_set() -> void:
	# TODO Get songs from fight res here
	fight_res = get_parent().fight_res
	
