extends AudioStreamPlayer

export var music_name: String
export var play_directly: bool = true

func _ready():
	if play_directly: 
		start_playing()

func start_playing():
	if settings.gets("music"):
		play(global.audio_timestamps[music_name])

func _exit_tree():
	if settings.gets("music"):
		global.audio_timestamps[music_name] = get_playback_position()

