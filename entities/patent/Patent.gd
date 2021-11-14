extends Node2D
class_name Patent

# `name` is the name you give the node in the tree
export var draft: Texture
export var id: String
export(String, MULTILINE) var description
export(int, 0, 1_000_000) var price
export var owned: bool = false
