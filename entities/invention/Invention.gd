extends Node2D
class_name Invention

export var draft: Texture
export(String, MULTILINE) var description
export(Array, String) var patent_id

export(float, 0.05, 0.75, 0.05) var color
export(float, 0.05, 0.75, 0.05) var function
export(float, 0.05, 0.75, 0.05) var shape

func _ready():
	randomize()

func sue_color(convincability: float) -> bool:
	return randf() <= color + convincability

func sue_function(convincability: float) -> bool:
	return randf() <= function + convincability

func sue_shape(convincability: float) -> bool:
	return randf() <= shape + convincability

func sue_charisma(convincability: float) -> bool:
	return randf() <= convincability