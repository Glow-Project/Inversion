extends Node2D
class_name Patent

# `name` is the name you give the node in the tree
export var draft: Texture
export var id: String
export(String, MULTILINE) var description
export var owned: bool = false
