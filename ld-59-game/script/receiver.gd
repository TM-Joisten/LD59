extends Node2D


var PHI1 = 0

@export var R = 200
var T = float(Time.get_ticks_msec())/1e3

@onready var Planet = $/root/main/Planet as Node2D
@onready var Sprite = $Sprite2D
func change_place():
	self.global_position.x = Planet.global_position.x + R*cos(PHI1)
	self.global_position.y = Planet.global_position.y + R*sin(PHI1)
	Sprite.rotation = 0
	PHI1 = randf_range(0,8)
	Sprite.rotate(get_angle_to(Planet.position)- PI/2)
	print(get_angle_to(Planet.position))
	

func _ready() -> void:
	change_place()
	pass
	

func _process(float) -> void:
	T = float(Time.get_ticks_msec())/1e3
	
