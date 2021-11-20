extends Node2D

func _ready():
	$AnimationPlayer.play("office_intro")

func kill_music():
	$ContinuousMusic.queue_free()

func _on_AnimationPlayer_animation_finished(_animName):
	get_tree().change_scene("res://cutscenes/bahamas_intro/BahamasIntro.tscn")
