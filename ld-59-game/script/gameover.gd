extends Control
signal retry 
@export var Nhouses = 0
@onready var subtext = $subtext
@onready var station = $station
@onready var button = $Button
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
