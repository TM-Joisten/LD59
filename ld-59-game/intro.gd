extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var money_file = FileAccess.open("res://save/money.txt", FileAccess.WRITE)
	var day_file = FileAccess.open("res://save/days.txt", FileAccess.WRITE)
	for i in range(0, 5):
		var upgrades_file = FileAccess.open("res://save/upgrades%s.txt" % [i], FileAccess.WRITE)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/gameloop.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
