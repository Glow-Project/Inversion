extends Control

func _ready():
	$MuteCheckBox.pressed = not AudioServer.is_bus_mute(0)

func _on_MuteCheckBox_toggled(button_pressed):
	AudioServer.set_bus_mute(0, not button_pressed)
