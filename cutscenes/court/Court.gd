extends Node2D

onready var patent: Patent = global.selected_patent
onready var invention: Invention = global.selected_invention
onready var decisions = [
	$Decisions.get_node("Color"), 
	$Decisions.get_node("Shape"), 
	$Decisions.get_node("Charisma"), 
	$Decisions.get_node("Function")
]
var convincibility: float

func _ready():
	if null in [patent, invention]:
		get_tree().change_scene("res://game/Game.tscn")
		return

	$AnimationPlayer.play("show_court")

	print("Name: %s\nShape Propability: %.2f\nColor Propability: %.2f\nFunction Propability: %.2f" % [invention.name, invention.shape, invention.color, invention.function])
	
	# If no patent or no invention is selected, exit to main scene
	if patent == null or invention == null:
		printerr("Either global.selected_patent or the global.selected_invention isn't declared")
		get_tree().change_scene("res://game/Game.tscn")
		
	$World/FlipChartInvention/Invention.texture = invention.draft
	$World/FlipChartPatent/Patent.texture = patent.draft

func _on_Shape_pressed():
	process_outcome(invention.sue_shape(convincibility))

func _on_Charisma_pressed():
	process_outcome(invention.sue_charisma(convincibility))

func _on_Color_pressed():
	process_outcome(invention.sue_color(convincibility))

func _on_Function_pressed():
	process_outcome(invention.sue_function(convincibility))

func process_outcome(won: bool) -> void:
	print("Won: %s" % won)
	if won:
		# The stuff that is supposed to happen when the player wins the case
		$AnimationPlayer.play("win")
		global.win_money()
	else:
		# The stuff that is supposed to happen when the player loses the case
		$AnimationPlayer.play("lose")
		global.lose_money()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name in ["win", "lose"]:
		global.regenerate_inventions()
		global.selected_invention = null
		global.was_in_court = true
		get_tree().change_scene("res://game/Game.tscn")

func play_mobile_decision():
	if global.mobile:
		$Decisions/AnimationPlayer.play("rotate_decisions")

func select_decision(index: int):
	var current_decision = decisions[index]
	current_decision.grab_focus()
	match current_decision.name:
		"Color": _on_Color_mouse_entered()
		"Shape": _on_Shape_mouse_entered()
		"Charisma": _on_Charisma_mouse_entered()
		"Function": _on_Function_mouse_entered()
	
func _on_Color_mouse_entered():
	$ArgumentLabel.text = "COLOR"

func _on_Shape_mouse_entered():
	$ArgumentLabel.text = "SHAPE"

func _on_Charisma_mouse_entered():
	$ArgumentLabel.text = "CHARISMA"

func _on_Function_mouse_entered():
	$ArgumentLabel.text = "FUNCTION"

func _on_mouse_exited():
	$ArgumentLabel.text = "CHOOSE\nARGUMENT"
