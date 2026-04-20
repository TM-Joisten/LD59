extends Node2D

var cash: int
var purchases = []
@onready var wallet: Label = $Control/wallet
@onready var upgr_1: Button = $Control/upgr1
@onready var upgr_2: Button = $Control/upgr2
@onready var upgr_3: Button = $Control/upgr3
@onready var upgr_4: Button = $Control/upgr4
@onready var upgr_5: Button = $Control/upgr5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(0, 5):
		disable_upgrades(i, read_upgrades(i))
	var money_file = FileAccess.open("res://save/money.txt", FileAccess.READ_WRITE)
	cash = int(money_file.get_as_text())
	wallet.set("text", str(cash)+"$")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_exit_pressed() -> void:
	save_money()
	get_tree().change_scene_to_file("res://scene/gameloop.tscn")
	pass # Replace with function body.

func save_money():
	var money_file = FileAccess.open("res://save/money.txt", FileAccess.WRITE)
	money_file.store_string(str(cash))
	money_file.close()

func save_upgrades(upgr_nr: int):
	var upgrades_file = FileAccess.open("res://save/upgrades%s.txt" % [upgr_nr], FileAccess.WRITE)
	upgrades_file.store_line(str(1))

func read_upgrades(upgr_nr: int):
	var upgrades_file = FileAccess.open("res://save/upgrades%s.txt" % [upgr_nr], FileAccess.READ)
	purchases = upgrades_file.get_as_text()
	upgrades_file.close()
	return int(purchases)

func disable_upgrades(upgr_nr, value):
	if upgr_nr == 0 and value == 1:
		upgr_1.set("disabled", true)
	elif upgr_nr == 0 and value == 0:
		upgr_1.set("disabled", false)
		
	if upgr_nr == 1 and value == 1:
		upgr_2.set("disabled", true)
	elif upgr_nr == 1 and value == 0:
		upgr_2.set("disabled", false)
		
	if upgr_nr == 2 and value == 1:
		upgr_3.set("disabled", true)
	elif upgr_nr == 2 and value == 0:
		upgr_3.set("disabled", false)
		
	if upgr_nr == 3 and value == 1:
		upgr_4.set("disabled", true)
	elif upgr_nr == 3 and value == 0:
		upgr_4.set("disabled", false)
		
	if upgr_nr == 4 and value == 1:
		upgr_5.set("disabled", true)
	elif upgr_nr == 4 and value == 0:
		upgr_5.set("disabled", false)


func _on_upgr_1_pressed() -> void:
	if cash >= 50:
		cash -= 50
		upgr_1.set("disabled", true)
		wallet.set("text", str(cash)+"$")
		save_upgrades(0)
	pass # Replace with function body.


func _on_upgr_2_pressed() -> void:
	if cash >= 100:
		cash -= 100
		upgr_2.set("disabled", true)
		wallet.set("text", str(cash)+"$")
		save_upgrades(1)
	pass # Replace with function body.


func _on_upgr_3_pressed() -> void:
	if cash >= 100:
		cash -= 100
		upgr_3.set("disabled", true)
		wallet.set("text", str(cash)+"$")
		save_upgrades(2)
	pass # Replace with function body.


func _on_upgr_4_pressed() -> void:
	if cash >= 150:
		cash -= 150
		upgr_4.set("disabled", true)
		wallet.set("text", str(cash)+"$")
		save_upgrades(3)
	pass # Replace with function body.


func _on_upgr_5_pressed() -> void:
	if cash >= 500:
		cash -= 500
		upgr_5.set("disabled", true)
		wallet.set("text", str(cash)+"$")
		save_upgrades(4)
		get_tree().change_scene_to_file("res://scene/game_won.tscn")
	pass # Replace with function body.
