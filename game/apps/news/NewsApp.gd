extends Control

func _ready():
	var inventions = invention_collection.get_random(2)
	
	if len(inventions) != 2:
		print("Inventions array has only %d items" % [len(inventions)])
		return
	
	$Invention_1.texture = inventions[0].draft
	$Invention_1/InventionLabel1.text = inventions[0].name
	
	$Invention_2.texture = inventions[1].draft
	$Invention_2/InventionLabel2.text = inventions[1].name

func _on_Back_pressed():
	get_tree().change_scene("res://game/Game.tscn")

func _on_SelectButton1_pressed():
	pass

func _on_Sue2_pressed():
	pass
