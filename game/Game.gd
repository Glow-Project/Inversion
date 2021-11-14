extends Control

func _ready():
	# Start the diashow in the background
	$Background.visible = true
	$Background/AnimationPlayer.play("diashow")
	
	if settings.gets("music"):
		$Music.play(global.audio_timestamps["bahamas"])

	$AnimationPlayer.play("enter")


func _on_Patents_pressed():
	get_tree().change_scene("res://game/apps/patent/PatentApp.tscn")

func _on_News_pressed():
	get_tree().change_scene("res://game/apps/news/NewsApp.tscn")

func _on_Lawsuits_pressed():
	get_tree().change_scene("res://game/apps/lawsuit/LawsuitApp.tscn")

func _on_Bank_pressed():
	get_tree().change_scene("res://game/apps/bank/BankApp.tscn")
