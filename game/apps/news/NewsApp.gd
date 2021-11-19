extends Control

var invention1:Invention
var invention2:Invention

func _ready():
	var inventions = invention_collection.get_random(2)
	
	if len(inventions) != 2:
		print("Inventions array has only %d items" % [len(inventions)])
		return
	
	invention1 = inventions[0]
	invention2 = inventions[1]
	
	$Invention_1.texture = invention1.draft
	$Invention_1/InventionLabel1.text = invention1.name
	
	$Invention_2.texture = invention2.draft
	$Invention_2/InventionLabel2.text = invention2.name

func _on_Back_pressed():
	get_tree().change_scene("res://game/Game.tscn")

func _on_SelectButton1_pressed():
	global.selected_invention = invention1

func _on_Sue2_pressed():
	global.selected_invention = invention2
