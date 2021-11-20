extends Control

func _ready():
	$AnimationPlayer.play("intro")

func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().change_scene("res://cutscenes/office_intro/OfficeIntro.tscn")
