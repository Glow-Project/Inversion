extends Control

export var text: String 
export var title: String  

# Called when the node enters the scene tree for the first time.
func _ready():
	$Text.text = text
	$Title.text = title

func _on_Back_pressed():
	hide()
