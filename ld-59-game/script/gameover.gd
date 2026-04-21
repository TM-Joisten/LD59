extends Control
signal retry 
@export var Nhouses = 0
@onready var subtext = $subtext
@onready var station = $station
@onready var button = $Button
@onready var shop: Node2D = $"../shop"
@onready var money: Control = $"../CanvasLayer/money"
@onready var days: Control = $"../CanvasLayer/days"
var settext: bool = false

func _ready() -> void:
	subtext.clear()
	subtext.insert_text(" \n you reached \n  " + str(Nhouses) +" houses ",0,0,true,false)
	$station/AnimatedSprite2D.play("signal_on")

pass # Replace with function body.
func _on_button_pressed() -> void:
	settext = false
	retry.emit()
	

func _on_control_2_counter_zero() -> void:
	if settext == false:
		subtext.clear()
		subtext.insert_text(" \n you reached \n  " + str(Nhouses) +" houses ",0,0,true,false)
		settext = true

func save_money():
	var save_money = FileAccess.open("res://save/money.txt", FileAccess.WRITE)
	save_money.store_string(str(money.cash))
	
func save_daycount():
	var save_daycount = FileAccess.open("res://save/days.txt", FileAccess.WRITE)
	save_daycount.store_string(str(days.day_count))

func clear_money():
	var file = FileAccess.open("res://save/money.txt", FileAccess.WRITE)
	file.remove_meta(str(money.cash))

func _on_shop_pressed() -> void:
	days.day_count += 1
	save_daycount()
	save_money()
	get_tree().change_scene_to_file("res://scene/shop.tscn")
	pass # Replace with function body.
