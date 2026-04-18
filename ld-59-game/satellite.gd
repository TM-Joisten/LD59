extends Node2D


@export var F = -1
@export var R = 300
@export var PHI1 = 0
@export var HAx = 1
@export var HAy = 1
var T = float(Time.get_ticks_msec())/1e3

@onready var Planet = $/root/main/Planet as Node2D
@onready var Area = $Area2D

func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	T = float(Time.get_ticks_msec())/1e3
	self.global_position.x = Planet.global_position.x + HAx*R*cos(F*T + PHI1)
	self.global_position.y = Planet.global_position.y + HAy*R*sin(F*T + PHI1)
