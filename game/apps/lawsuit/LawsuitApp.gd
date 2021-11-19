extends Control

var selected_patent: Patent

onready var current_invention = global.selected_invention
#* In future current_invention should be global.selected_invention

func _ready():
	if current_invention == null: 
		current_invention = invention_collection.get_random(1)[0]
	
	sync_state()

func sync_state():
	$VisibleInvention/Titel.text = current_invention.name
	$VisibleInvention/Description.text = current_invention.description
	$VisibleInvention/Draft.texture = current_invention.draft

	$PatentList.clear()
	
	var patents =  patent_collection.get_all()
	for i in range(len(patents)):
		$PatentList.add_item(str(patents[i]))
		$PatentList.set_item_tooltip_enabled(i,false)

func _on_Back_pressed():
	get_tree().change_scene("res://game/Game.tscn")

func _on_PatentList_item_selected(index):
	selected_patent = patent_collection.get_all()[index]


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
