extends Node2D


var F = -1
var R = 300
var PHI1 = 0
var T = float(Time.get_ticks_msec())/1e3

@onready var Planet = $/root/main/Planet as Node2D

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	T = float(Time.get_ticks_msec())/1e3
	print(self.position)
	self.global_position.x = Planet.global_position.x + R*cos(F*T + PHI1)
	self.global_position.y = Planet.global_position.y + R*sin(F*T + PHI1)
