extends AudioStreamPlayer

export var music_name: String

func _ready():
	if settings.gets("music"):
		play(global.audio_timestamps[music_name])

func _exit_tree():
	if settings.gets("music"):
		global.audio_timestamps[music_name] = get_playback_position()

