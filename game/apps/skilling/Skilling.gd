extends Control

onready var decisions = [
	$Decisions.get_node("Color"), 
	$Decisions.get_node("Shape"), 
	$Decisions.get_node("Charisma"), 
	$Decisions.get_node("Function")
]

func _ready():
	if global.mobile:
		$Decisions/AnimationPlayer.play("rotate_decisions")

func select_decision(index: int):
	decisions[index].grab_focus()

func _on_focus_entered(name):
	$SkillName.text = name

func _on_Color_pressed():
	skills.color += 0.1
	leave()

func _on_Charisma_pressed():
	skills.charisma += 0.1
	leave()

func _on_Function_pressed():
	skills.function += 0.1
	leave()

func _on_Shape_pressed():
	skills.shape += 0.1
	leave()


func leave():
	get_tree().change_scene("res://game/Game.tscn")
