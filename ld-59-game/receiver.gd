extends Node2D



@export var PHI1 = 0
@export var PHI2 = 0
@export var R = 150
var T = float(Time.get_ticks_msec())/1e3
var random = RandomNumberGenerator.new()

@onready var Planet = $/root/main/Planet as Node2D

func change_place():
	PHI1 = randf_range(1,1.5)
	PHI2 = randf_range(2,2.5)
	self.rotate(get_angle_to(Planet.position-self.position))

func _ready() -> void:
	change_place()
	pass
	

func _process(float) -> void:
	T = float(Time.get_ticks_msec())/1e3
	print(self.position)
	self.global_position.x = Planet.global_position.x + R*cos(PHI1)
	self.global_position.y = Planet.global_position.y + R*sin(PHI2)
