extends Node2D

@onready var sig: Node2D = $Signal
@onready var sprite: Sprite2D = $NavigationLink2D/PathFollow2D/Sprite2D
@onready var beam: Node2D = $"."
#@onready var satellite: Node2D = $"../../Satellite"
@onready var receiver: Node2D = $"../../Receiver"

var destination = Vector2(0.0, 0.0)
var SPEED = 1
var shoot = false	
var parent = self

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func fire(parent: Node2D, same_x: bool, same_y: bool) -> void:
	if (same_x == true) and (same_y == true):
		print("dont fire")
	else:
		shoot = true
		beam.set_visible(true)
		print("fire")
		await get_tree().create_timer(1).timeout                      
		beam.set_visible(false)
		pass
	pass
