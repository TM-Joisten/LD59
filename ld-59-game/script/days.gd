extends Control

@onready var highlight: ColorRect = $bar/highlight
@onready var highlight_2: ColorRect = $bar/highlight2
@onready var bar: TextureRect = $bar
@onready var gameover: Control = $"../../gameover"

var progress: bool = false
var day_count: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	day_count = get_daycount()
	if day_count > 0:
		progress = true
	print(day_count)
	highlight.global_position.x = bar.global_position.x + (1.0 * highlight.get("scale").x)
	highlight.global_position.y = bar.global_position.y + (1.5 * highlight.get("scale").y)
	
	highlight_2.global_position.x = bar.global_position.x + (1.0 * highlight.get("scale").x) * 145
	highlight_2.global_position.y = bar.global_position.y + (1.5 * highlight.get("scale").y)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if progress == true:
		if day_count < 6:
			print(day_count)
			highlight.global_position.x = bar.global_position.x + (50.0 * float(day_count) - (1.5 * float(day_count)))
			progress = false
		elif day_count == 6:
			day_count = 0
			progress = false
			get_tree().change_scene_to_file("res://scene/gamelost.tscn")
	pass

func get_daycount():
	var daycount_file = FileAccess.open("res://save/days.txt", FileAccess.READ)
	var days = daycount_file.get_as_text()
	return int(days)
