extends Control

func _ready():
	# Start the diashow in the background
	$Background.visible = true
	$Background/AnimationPlayer.play("diashow")

	if !global.game_already_started:
		$AnimationPlayer.play("enter")
		global.game_already_started = true
	elif global.was_in_court:
		$AnimationPlayer.play("from_court")
		global.was_in_court = false
	else:
		$AnimationPlayer.play("RESET")
	sync_state()

func _process(_delta):
	if Input.is_action_just_pressed("skip") and $AnimationPlayer.current_animation == "tutorial":
		$AnimationPlayer.playback_speed = 50

func sync_state():
	$Apps/Lawsuits.disabled = global.selected_invention == null
	$Money.text = "$ %d" % bank_account.current_money
	
	$Skills/Charisma/Value.text = "%.1f" % skills.charisma
	$Skills/Shape/Value.text = "%.1f" % skills.shape
	$Skills/Color/Value.text = "%.1f" % skills.color
	$Skills/Function/Value.text = "%.1f" % skills.function

func _on_Patents_pressed():
	if !$AnimationPlayer.is_playing():
		get_tree().change_scene("res://game/apps/patent/PatentApp.tscn")

func _on_News_pressed():
	if !$AnimationPlayer.is_playing():
		get_tree().change_scene("res://game/apps/news/NewsApp.tscn")

func _on_Lawsuits_pressed():
	if !$AnimationPlayer.is_playing():
		get_tree().change_scene("res://game/apps/lawsuit/LawsuitApp.tscn")

func _on_Shop_pressed():
	if !$AnimationPlayer.is_playing():
		get_tree().change_scene("res://game/apps/shop/ShopApp.tscn")

func _on_AnimationPlayer_animation_finished(anim_name: String):
	if anim_name == "enter":
		$AnimationPlayer.play("tutorial")
	elif anim_name == "tutorial":
		# This Node does weird things when not deleted
		$Call.queue_free()
	$AnimationPlayer.playback_speed = 1

func _on_HelpButton_pressed():
	$HelpText.show()
