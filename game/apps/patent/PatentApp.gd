extends Control


func _ready():
	var patents =  patent_collection.get_all()
	for i in range(len(patents)):
		$PatentList.add_item(patents[i].name)
		$PatentList.set_item_tooltip_enabled(i,false)

func _on_Back_pressed():
	get_tree().change_scene("res://game/Game.tscn")


func _on_PatentList_item_selected(index):
	var collection = patent_collection.get_all()
	if index > len(collection)-1:
		print("Invalid selected patent with index %d, while the max index is %d" % [index, len(collection)])
		return

	$PatentID.text = collection[index].id
	$PatentName.text = collection[index].name
	$PatentDraft.texture = collection[index].draft
	$PatentDescription.text = collection[index].description
