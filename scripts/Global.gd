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
var available_inventions: Array = []

func win_money():
	bank_account.add_money(win_money_amount)
func lose_money():
	bank_account.withdraw(lose_money_amount)

func _ready():
	audio_timestamps["bahamas"] = 0.0
	audio_timestamps["sad_music"] = 0.0


func append_new_inventions(patent: Patent):
	available_inventions += invention_collection.get_by_id(patent.id)

func remove_invention(invention: Invention):
	available_inventions.remove(available_inventions.find(invention))

func refill_inventions():
	available_inventions.clear()
	for patent in patent_collection.get_owned():
		available_inventions += invention_collection.get_by_id(patent.id)

func regenerate_inventions():
	if len(available_inventions) <= 1:
		refill_inventions()

	var available_inventions_copy: Array = available_inventions.duplicate()

	inventions = []

	for _i in range(2):
		var rand_pos = randi() % len(available_inventions_copy)
		inventions.append(available_inventions_copy[rand_pos])
		available_inventions_copy.remove(rand_pos)
