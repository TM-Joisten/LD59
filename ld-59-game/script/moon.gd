extends Node2D


@export var F = -1.0
@export var R =4*128
@export var PHI1 = 0

var T = float(Time.get_ticks_msec())/1e3

@export var Planet = Node2D

func id():
	return "Moon"

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	T = float(Time.get_ticks_msec())/1e3
	self.global_position.x = Planet.global_position.x + R*cos(F*T + PHI1)
	self.global_position.y = Planet.global_position.y + R*sin(F*T + PHI1)
