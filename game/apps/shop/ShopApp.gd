extends Control

var patent_article_scene = preload("res://components/patent_article/PatentArticle.tscn")

func _ready():
	sync_state()

func sync_state():
	# Remove all children of `Items`
	for child in $Items.get_children():
		$Items.remove_child(child)

	# Add all Patents to `Items`
	for patent in patent_collection.get_all():
		var patent_article = patent_article_scene.instance()
		patent_article.patent = patent
		patent_article.connect("bought", self, "bought")
		$Items.add_child(patent_article)

func bought():
	global.regenerate_inventions()
	get_tree().change_scene("res://game/apps/skilling/Skilling.tscn")

func _on_Back_pressed():
	get_tree().change_scene("res://game/Game.tscn")
