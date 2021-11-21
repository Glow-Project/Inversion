extends Control

signal game_won

func _ready():
	$BuyButton.disabled = bank_account.current_money < 1400000

func _on_BuyButton_pressed():
	if bank_account.current_money >= 1400000:
		emit_signal("game_won")
