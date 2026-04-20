extends Control

@onready var highlight: ColorRect = $bar/highlight
@onready var bar: TextureRect = $bar
@onready var gameover: Control = $"../../gameover"

var progress: bool = false
var day_count: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	highlight.global_position.x = bar.global_position.x + (1.0 * highlight.get("scale").x)
	highlight.global_position.y = bar.global_position.y + (1.5 * highlight.get("scale").y)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if progress == true:
		if day_count < 6:
			highlight.position.x += 24.0 * highlight.get("scale").x
			day_count += 1
			progress = false
		elif day_count == 6:
			day_count = 0
			progress = false
		pass
	pass
