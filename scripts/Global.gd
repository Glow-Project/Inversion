extends Node

var audio_timestamps: Dictionary
var game_already_started: bool = false

func _ready():
	audio_timestamps["bahamas"] = 0.0
