extends Node2D

onready var patent: Patent = global.selected_patent
onready var invention: Invention = global.selected_invention
var convincibility: float

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
	process_outcome(invention.sue_shape(convincibility))

func _on_Charisma_pressed():
	process_outcome(invention.sue_charisma(convincibility))

func _on_Color_pressed():
	process_outcome(invention.sue_color(convincibility))

func _on_Function_pressed():
	process_outcome(invention.sue_function(convincibility))

func process_outcome(won: bool) -> void:
	if won:
		pass
	else:
		pass
