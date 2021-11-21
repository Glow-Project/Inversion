extends Control

var patent: Patent

signal bought(patent)

func _ready():
	$Draft.texture = patent.draft
	$Name.text = patent.name
	
	if patent.owned:
		$Price.text = "OWNED"
		$BuyButton.hide()
	else:
		$Price.text = "%d USD" % [patent.price]
		$BuyButton.disabled = patent.price > bank_account.current_money

func _on_BuyButton_pressed():
	if patent.buy():
		emit_signal("bought", patent)
