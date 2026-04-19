extends Node2D

@onready var SIG: Node2D = $Signal
@onready var STATION: Node2D = $station
@onready var GOAL: Node2D = $Receiver
@onready var COUNTER: Control = $CanvasLayer/Control2
@onready var GAMEOVER: Control = $gameover
@export var housecounter = 0
@export var reset = false


# set player
func _ready() -> void:
	SIG.position = STATION.position
	SIG.pressable = true
	$gameover.hide()
	# random planet spawning
	
# set satellites
 
# reach receiver
# reset player 
# reset receiver

func _on_receiver_reach_goal() -> void:
	var planets = get_tree().get_nodes_in_group("planet")
	print(planets)
	var p_i = randi() % len(planets)
	GOAL.Planet = planets[p_i]
	print(planets[p_i])
	GOAL.change_place()
	COUNTER.counter += 15
	housecounter += 1
	
	pass # Replace with function body.


func _on_control_2_counter_zero() -> void:
	$CanvasLayer.hide()
	GAMEOVER.show()
	SIG.position = STATION.position    
	GAMEOVER.position=SIG.position
	GAMEOVER.z_index = 10
	GAMEOVER.Nhouses = housecounter
	SIG.pressable = false


func _on_gameover_retry() -> void:
	housecounter= 0
	COUNTER.counter += 100
	$CanvasLayer.show()
	$gameover.hide()
	_ready()  
