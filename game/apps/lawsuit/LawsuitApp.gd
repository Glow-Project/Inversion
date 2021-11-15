extends Control

var selected_patent: Patent

func _ready():
	sync_state()

func sync_state():
	var current_invention = invention_collection.get_random(1)[0]
	$VisibleInvention/Titel.text = current_invention.name
	$VisibleInvention/Description.text = current_invention.description
	$VisibleInvention/Draft.texture = current_invention.draft

	$SelectPatent.clear()
	for patent in patent_collection.get_owned():
		print(str(patent))
		$SelectPatent.add_item(str(patent))

func _on_Back_pressed():
	get_tree().change_scene("res://game/Game.tscn")


func _on_SelectPatent_item_selected(index):
	selected_patent = patent_collection.get_owned()[index]
