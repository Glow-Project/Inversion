extends Control

func _ready():
	# Start the diashow in the background
	$Background.visible = true
	$Background/AnimationPlayer.play("diashow")

	if !global.game_already_started:
		$AnimationPlayer.play("enter")
		global.game_already_started = true

	$Money.text = "$ %d" % bank_account.current_money
	$Apps/Lawsuits.disabled = global.selected_invention == null

func _on_Patents_pressed():
	get_tree().change_scene("res://game/apps/patent/PatentApp.tscn")

func _on_News_pressed():
	get_tree().change_scene("res://game/apps/news/NewsApp.tscn")

func _on_Lawsuits_pressed():
	get_tree().change_scene("res://game/apps/lawsuit/LawsuitApp.tscn")

func _on_Shop_pressed():
	get_tree().change_scene("res://game/apps/shop/ShopApp.tscn")
