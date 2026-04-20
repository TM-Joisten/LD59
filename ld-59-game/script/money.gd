extends Control

@onready var wallet: Label = $wallet
@onready var state_manager: Node2D = $"../.."

var cash: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var file = FileAccess.open("res://save/money.txt", FileAccess.READ)
	cash = int(file.get_as_text())
	wallet.set("text", str(cash)+"$")
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _update():
	wallet.set("text", str(cash)+"$")
