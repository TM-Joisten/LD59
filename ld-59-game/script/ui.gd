extends Control

@export var counter = 100
var X = 1.5   # Ticks/s
var delta_time = 0
signal counterZERO
@onready var Textbox = $TextEdit
@onready var sprite = $AnimatedSprite2D
@onready var animations = sprite.sprite_frames.get_animation_names()

func _process(delta: float) -> void:
	delta_time += delta
	if delta_time >= 1.0 and  counter !=0 :
		if counter > 100:
			counter = 100
		Textbox.clear()
		delta_time = 0
		counter -= X
		Textbox.insert_text("\n " + str(int(counter)) + "%",0,0,true,false) 
		if counter < 75 && counter > 25:
			sprite.play("medium")
		elif counter <= 25:
			sprite.play("sad")
		else: 
			sprite.play("happy")
		if counter <= 0:
			counterZERO.emit()
