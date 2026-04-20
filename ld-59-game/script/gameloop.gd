extends Node2D

@onready var SIG: Node2D = $Signal
@onready var STATION: Node2D = $station
@onready var GOAL: Node2D = $Receiver
@onready var COUNTER: Control = $CanvasLayer/Control2
@onready var GAMEOVER: Control = $gameover
@onready var PLANETINDICATOR: Control = $CanvasLayer/Control3
@onready var MUSIC: Node2D = $music
@export var housecounter = 0
@export var reset = false
@onready var days: Control = $CanvasLayer/days
@onready var money: Control = $CanvasLayer/money


# set player
func _ready() -> void:
	MUSIC.get_child(0).set_playing(true)
	SIG.position = STATION.position
	SIG.pressable = true
	$gameover.hide()
	# random planet spawning
	

func _on_receiver_reach_goal() -> void:
	await get_tree().create_timer(1).timeout
	var planets = get_tree().get_nodes_in_group("planet")
	var p_i = randi() % len(planets)
	GOAL.Planet = planets[p_i]
	PLANETINDICATOR.id = GOAL.Planet.id()
	GOAL.change_place()
	COUNTER.counter += 15
	housecounter += 1
	money.cash += 10
	money._update()

	pass # Replace with function body.


func _on_control_2_counter_zero() -> void:
	$Signal/Camera2D.position_smoothing_speed = 20
	$CanvasLayer.hide()
	GAMEOVER.show()
	MUSIC.get_child(0).set_playing(false)
	MUSIC.get_child(1).set_playing(true)
	SIG.position = STATION.position    
	GAMEOVER.position=SIG.position
	GAMEOVER.z_index = 10
	GAMEOVER.Nhouses = housecounter
	SIG.pressable = false


func _on_gameover_retry() -> void:
<<<<<<< HEAD
	$Signal/Camera2D.position_smoothing_speed = 10.0
=======
	days.set("progress", true)
>>>>>>> origin
	housecounter= 0
	COUNTER.counter = 100
	MUSIC.get_child(0).set_playing(true)
	MUSIC.get_child(1).set_playing(false)
	$CanvasLayer.show()
	$gameover.hide()
	_ready()  
