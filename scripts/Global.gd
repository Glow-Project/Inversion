extends Node

var audio_timestamps: Dictionary
var game_already_started: bool = false
var was_in_court: bool = false

var mobile: bool = false


# 'Parameters' for court scene
var selected_patent: Patent = null
var selected_invention: Invention = null
var win_money_amount: int
var lose_money_amount: int

# 'Parameters' for news app
var inventions: Array = []

func win_money():
	bank_account.add_money(win_money_amount)
func lose_money():
	bank_account.withdraw(lose_money_amount)

func _ready():
	audio_timestamps["bahamas"] = 0.0
	print(OS.get_name())

func regenerate_inventions():
	var all_inventions_available: Array = []
	inventions = []

	for patent in patent_collection.get_owned():
		all_inventions_available += invention_collection.get_by_id(patent.id)
	
	var rand_pos = randi() % len(all_inventions_available)
	inventions.append(all_inventions_available[rand_pos])
	all_inventions_available.remove(rand_pos)
	rand_pos = randi() % len(all_inventions_available)
	inventions.append(all_inventions_available[rand_pos])
