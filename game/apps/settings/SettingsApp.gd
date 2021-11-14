extends Control

func _ready():
	sync_state()

func sync_state():
	$GridContainer/Fullscreen.pressed = settings.gets("fullscreen")
	$GridContainer/Music.pressed = settings.gets("music")

func _on_Fullscreen_pressed():
	settings.sets("fullscreen", $GridContainer/Fullscreen.pressed)
	sync_state()

func _on_Music_pressed():
	settings.sets("music", $GridContainer/Music.pressed)
	sync_state()
