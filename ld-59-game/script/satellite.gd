extends Node2D


@export var F = -1.0
@export var R =4*128
@export var PHI1 = 0.0
@export var HAx = 1.0
@export var HAy = 1.0
var T = float(Time.get_ticks_msec())/1e3
@export var type = "V1"
@export var Planet =Node2D

@onready var Area = $Area2D
@onready var Sprite = $AnimatedSprite2D

func _ready() -> void:
	Sprite.play(type)
	pass
	
func _process(delta: float) -> void:
	Sprite.rotation = 0
	Sprite.rotate(get_angle_to(Planet.position) -  0.25*PI)	
	T = float(Time.get_ticks_msec())/1e3
	self.global_position.x = Planet.global_position.x + HAx*R*cos(F*T + PHI1)
	self.global_position.y = Planet.global_position.y + HAy*R*sin(F*T + PHI1)
