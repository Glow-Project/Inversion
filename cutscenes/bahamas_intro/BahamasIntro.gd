extends Node2D

var skipable = false
var touched = false
export var music: AudioStream

func _ready():
	$AnimationPlayer.play("bahamas_intro")

func _exit_tree():
	global.audio_timestamps["bahamas"] = $Music.get_playback_position()

func _input(event):
	if skipable and event is InputEventScreenTouch:
		touched = true
		global.mobile = true

func _process(_delta):
	if skipable and (Input.is_action_just_pressed("skip") or touched):
		skipable = false
		$AnimationPlayer.play("into_banana")

func play_music():
	$Music.stream = music
	$Music.play()

func _on_AnimationPlayer_animation_finished(anim_name):
	skipable = anim_name == "bahamas_intro"
	if anim_name == "into_banana":
		get_tree().change_scene("res://game/Game.tscn")
