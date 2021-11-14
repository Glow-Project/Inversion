extends Control

var patent: Patent

func _ready():
	$Draft.texture = patent.draft
	$Name.text = patent.name
	$Price.text = "%d USD" % [patent.price]
