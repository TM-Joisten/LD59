extends Control
@export var Nhouses = 0
@onready var subtext = $subtext
@onready var button = $Button

func _ready() -> void:
	subtext.clear()
	subtext.insert_text(" \n you reached \n  " + str(Nhouses) +" houses ",0,0,true,false)
