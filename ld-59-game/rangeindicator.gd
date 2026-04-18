extends Node2D

@onready var parent = self.get_parent
@onready var sprite = $AnimatedSprite2Ds
@export var goal = Node2D
var animations = sprite.sprite_frames.get_animation_names()

func get_dist():
	abs(parent.position - goal.position)
	return 

func _ready() -> void:
	$AnimatedSprite2D.play(animations[0])
