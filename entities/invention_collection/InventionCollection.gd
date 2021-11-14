extends Node2D

var inventions: Array = []

func _ready():
	load_inventions()
	randomize()

func load_inventions() -> void:
	for child in get_children():
		if child is Invention:
			inventions.append(child)

func get_by_id(id: String) -> Array:
	var matching_inventions: Array = []
	for invention in inventions:
		if id in invention.patent_id:
			matching_inventions.append(invention)
	return matching_inventions

func get_random(amount: int) -> Array:
	var all_inventions := inventions.duplicate()
	var random_inventions: Array = []
	for _x in range(amount):
		var index = randi() % len(all_inventions)
		random_inventions.append(all_inventions[index])
		all_inventions.remove(index)
	return random_inventions
