extends Node2D

@onready var SIG: Node2D = $Signal
@onready var STATION: Node2D = $station
@onready var GOAL: Node2D = $Receiver
@onready var COUNTER: Control = $CanvasLayer/Control2
@export var housecounter = 0
# set player
func _ready() -> void:
	SIG.position = STATION.position
	GOAL.change_place()
# set satellites
 
# reach receiver
# reset player 
# reset receiver

func _on_receiver_reach_goal() -> void:
	get_tree().create_timer(50).timeout
	GOAL.change_place()
	COUNTER.counter += 15
	housecounter +=1
	pass # Replace with function body.
