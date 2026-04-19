extends Control

@export var id = ""
@onready var sprite = $AnimatedSprite2D

func _process(delta: float) -> void:
	sprite.play(id)
