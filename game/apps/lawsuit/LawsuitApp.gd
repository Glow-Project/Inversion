extends Control

var selected_patent: Patent

onready var current_invention = global.selected_invention

func _ready():
	var patents = patent_collection.get_owned()
	for i in range(len(patents)):
		$PatentList.add_item(str(patents[i]))
		$PatentList.set_item_tooltip_enabled(i,false)
	sync_state()

func sync_state():
	$VisibleInvention/Titel.text = current_invention.name
	$VisibleInvention/Description.text = current_invention.description
	$VisibleInvention/Draft.texture = current_invention.draft

	if selected_patent != null:
		$Costs/WinValue.text = "+ %d $" % (global.win_money_amount)
		$Costs/LoseValue.text = "- %d $" % (global.lose_money_amount)
	else:
		$Costs/WinValue.text = "---"
		$Costs/LoseValue.text = "---"

func _on_Back_pressed():
	get_tree().change_scene("res://game/Game.tscn")

func _on_PatentList_item_selected(index):
	selected_patent = patent_collection.get_owned()[index]

	print(selected_patent.price)

	global.win_money_amount = int(selected_patent.price * 2)
	global.lose_money_amount = int(global.win_money_amount * 0.5)
	sync_state()


func _on_Sue_pressed():
	if selected_patent == null:
		# Place UI warning here
		printerr("Oh no! Nothing is selected")
	elif selected_patent.id == current_invention.patent_id:
		# When everything is ok
		global.selected_patent = selected_patent
		global.selected_invention = current_invention
		get_tree().change_scene("res://cutscenes/court/Court.tscn")
	else:
		printerr("Oh no!!! This does not match :((((((")
