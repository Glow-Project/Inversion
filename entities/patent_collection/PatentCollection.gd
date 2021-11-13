extends Node2D

onready var patents: Array = []

func _ready():
	load_patents()

func load_patents() -> void:
	for child in get_children():
		if child is Patent:
			patents.append(child)

func get_owned() -> Array:
	var owned_patents: Array = []
	for patent in patents:
		if patent.owned:
			owned_patents.append(patent)
	return owned_patents

func get_not_owned() -> Array:
	var not_owned_patents: Array = []
	for patent in patents:
		if !patent.owned:
			not_owned_patents.append(patent)
	return not_owned_patents

func get_all() -> Array:
	return patents
