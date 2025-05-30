extends AudioStreamPlayer
# Music Player
# TODO possibly account for if only default music is added

var music_res : MusicRes
var game_is_running : bool = true

func _ready() -> void:
	GlobalSignal.connect("game_won", Callable(self, "_on_game_won"))

func play_track(track : AudioStream) -> void:
	## Sets new stream and plays it
	stream = track
	play()
	
func _on_game_fight_res_set() -> void:
	## This is where music_res is set, 
	## as well as where intro music plays 
	if get_parent().fight_res.music_res:
		music_res = get_parent().fight_res.music_res
	else:
		return
	
	play_track(music_res.song_intro)
	await self.finished
	
func _on_finished() -> void:
	## If game is not over, loop song_body
	if not game_is_running:
		return
	
	play_track(music_res.song_body)

func _on_game_won() -> void:
	## Stop song_body, and play song_outro ONCE
	stop()
	game_is_running = false
	play_track(music_res.song_outro)
	
