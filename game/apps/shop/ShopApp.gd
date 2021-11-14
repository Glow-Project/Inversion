extends Control

var patent_article_scene = preload("res://components/patent_article/PatentArticle.tscn")

func _ready():
	for patent in patent_collection.get_all():
		var patent_article = patent_article_scene.instance()
		patent_article.patent = patent
		$Items.add_child(patent_article)

func _on_Back_pressed():
	get_tree().change_scene("res://game/Game.tscn")
