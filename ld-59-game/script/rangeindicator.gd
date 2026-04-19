extends Node2D

@export var parent = Node2D
@onready var sprite = $AnimatedSprite2D
#@onready var goal: Node2D = $"../../../station"
@onready var goal: Node2D = $"../../../Receiver"
@onready var animations = sprite.sprite_frames.get_animation_names()

func get_dist():
	var distx = abs(goal.global_position.x - parent.global_position.x)
	var disty = abs(goal.global_position.y - parent.global_position.y)
	var dist = abs(distx+disty)
	return dist
	
func _ready() -> void:
	$AnimatedSprite2D.play(animations[1])

func _process(delta: float) -> void:
	var dist = get_dist()
	if dist > 2200:
		$AnimatedSprite2D.play(animations[1])
	if dist < 2200 && dist >1200:
		$AnimatedSprite2D.play(animations[2])
	if dist <= 1200 :
		$AnimatedSprite2D.play(animations[0])
  
