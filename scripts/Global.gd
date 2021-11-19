extends Node

var audio_timestamps: Dictionary
var game_already_started: bool = false

# 'Parameters' for court scene
var selected_patent: Patent = null
var selected_invention: Invention = null

func _ready():
	audio_timestamps["bahamas"] = 0.0
