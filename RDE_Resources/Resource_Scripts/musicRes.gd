extends Resource
class_name MusicRes
# MusicRes is used to hold music files for a specifc fight
# Not connected to mob so that changing music for a level is more flexible

# The way fight music works is it plays song_intro ONCE,
# then it loops the song_body throughout the fight
# then once fight ends, cut song_body and start playing song_outro

@export_category("Music")
@export var song_default : AudioStream # The whole music track

@export var song_intro : AudioStream # The intro and body of music track
@export var song_body : AudioStream # The body of music track (loops throughout fight)
@export var song_outro : AudioStream # Outro of music track (plays on game won)
