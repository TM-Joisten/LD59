extends Node2D


var PHI1 = 0

@export var R = 2.1*128
var T = float(Time.get_ticks_msec())/1e3

@onready var Planet = $/root/main/Planet as Node2D
@onready var Sprite = $Area2D/AnimatedSprite2D
func change_place():
	PHI1 = randf_range(-1,1)
	self.global_position.x = Planet.global_position.x + R*cos(PHI1)
	self.global_position.y = Planet.global_position.y + R*sin(PHI1)
	Sprite.rotation = 0

	Sprite.rotate(get_angle_to(Planet.position)- PI/2)
	print(get_angle_to(Planet.position))
	

func _ready() -> void:
	randomize()
	change_place()
	var animations = Sprite.sprite_frames.get_animation_names()
	var random_ani = animations[randi() % animations.size()]
	Sprite.play(random_ani)
	 
	pass
	

func _process(float) -> void:
	T = float(Time.get_ticks_msec())/1e3
	
