extends AudioStreamPlayer
# Music Player

var music_res

var song_intro : AudioStream
var song_body : AudioStream
var song_outro : AudioStream

func _ready() -> void:
	pass
	
func _on_game_fight_res_set() -> void:
	# TODO Get songs from fight res here
	music_res = get_parent().music_res
	
	stream = music_res.song_intro
	self.play()
	
	await self.finished
	stream = music_res.song_body
	self.play()
	
