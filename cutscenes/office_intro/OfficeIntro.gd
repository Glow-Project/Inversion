extends Node2D

func _ready():
	$AnimationPlayer.play("office_intro")

func _on_AnimationPlayer_animation_finished(_animName):
	get_tree().change_scene("res://cutscenes/bahamas_intro/BahamasIntro.tscn")
