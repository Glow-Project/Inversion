extends Node2D

onready var patent: Patent = global.selected_patent
onready var invention: Invention = global.selected_invention

func _ready():
	patent = patent_collection.get_all()[0]
	invention = invention_collection.get_random(1)[0]
	print("Name: %s\nShape Propability: %.2f\nColor Propability: %.2f\nFunction Propability: %.2f" % [invention.name, invention.shape, invention.color, invention.function])
	
	# If no patent or no invention is selected, exit to main scene
	if patent == null or invention == null:
		printerr("Either the Invention or the Patent isn't declared")
		get_tree().change_scene("res://game/Game.tscn")

func _on_Shape_pressed():
	print("Invention propability: %f" % invention.shape)
	print(invention.sue_shape(0.2))

func _on_Charisma_pressed():
	print(invention.sue_charisma(0.2))

func _on_Color_pressed():
	print(invention.sue_color(0.2))

func _on_Function_pressed():
	print(invention.sue_function(0.2))
