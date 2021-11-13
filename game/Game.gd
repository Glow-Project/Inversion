extends Control

func _on_PatentsButton_pressed():
	get_tree().change_scene("res://game/apps/patent/PatentApp.tscn")

func _on_NewsButton_pressed():
	get_tree().change_scene("res://game/apps/news/NewsApp.tscn")

func _on_LawsuitButton_pressed():
	get_tree().change_scene("res://game/apps/lawsuit/LawsuitApp.tscn")

func _on_BankButton_pressed():
	get_tree().change_scene("res://game/apps/bank/BankApp.tscn")
