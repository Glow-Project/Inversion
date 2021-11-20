extends Control

var patent: Patent

signal bought

func _ready():
	$Draft.texture = patent.draft
	$Name.text = patent.name
	$Price.text = "%d USD" % [patent.price]
	$BuyButton.disabled = patent.owned


func _on_BuyButton_pressed():
	if patent.buy():
		emit_signal("bought")
