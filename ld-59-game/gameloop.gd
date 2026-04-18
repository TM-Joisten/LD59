extends Node2D

@onready var SIG = $Signal
@onready var STATION = $station
@onready var GOAL = $Receiver


# set player
func _ready() -> void:
	SIG.position = STATION.position
	GOAL.change_place()
# set satellites


# reach receiver
func _on_receiver_reach_goal() -> void:
	get_tree().create_timer(50).timeout
	GOAL.change_place()
	pass # Replace with function body.

# reset player
# reset receiver
