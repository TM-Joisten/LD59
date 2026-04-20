extends Node2D

var in_range: bool
@export var pressable: bool = true
var list = []
var parent = self
var current_parent = parent
var area_array = []

#@onready var sat = $/root/state_manager/Satellite as Node2D
#@onready var STAT = $/root/state_manager/station
@onready var state_manager: Node2D = $".."
@onready var sat: Node2D = $"../Satellite"
@onready var STAT: Node2D = $"../station"
@onready var GOAL: Node2D = $"../Receiver"
@export var cooldown: float = 1
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var audio = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	sprite.rotate(0.01)
	if pressable == true:
		sprite.play("yes")
	else:
		sprite.play("no")
	var area_array = self.get_child(1).get_overlapping_areas()
	if (in_range == true) and (Input.get_action_strength("switch") > 0) and (pressable == true):
		for element in area_array:            # figure out nearest object
			var x_dist = abs(self.global_position.x - element.get_parent().global_position.x)
			var y_dist = abs(self.global_position.y - element.get_parent().global_position.y)
			var distance = abs(x_dist - y_dist)
			list.append(distance)
		for index in len(list):
			if index == list.find(list.min()):
				if area_array[index].get_parent() != current_parent:
					current_parent = area_array[index].get_parent()
					audio.play()
					
				else:
					list[index] += 5000
		if area_array[list.find(list.min())].get_parent() != current_parent:
			current_parent = area_array[list.find(list.min())].get_parent()
		list.clear()
		deadtime(cooldown)
		
	elif (Input.get_action_strength("switch") > 0) and (pressable == true):
		deadtime(cooldown)
		pass
	
	self.global_position.x = current_parent.global_position.x
	self.global_position.y = current_parent.global_position.y
	
	if (self.global_position.x == GOAL.global_position.x) and (self.global_position.y == GOAL.global_position.y):
		_on_receiver_reach_goal()
		state_manager._on_receiver_reach_goal()
		
	
func deadtime(cooldown):
	pressable = false
	await get_tree().create_timer(cooldown).timeout
	pressable = true

func _on_area_2d_area_entered(area: Area2D) -> void:
	in_range = true
	pass # Replace with function body.


func _on_area_2d_area_exited(area: Area2D) -> void:
	in_range = false
	pass # Replace with function body.

func _on_receiver_reach_goal() -> void:
	current_parent = STAT
	pass # Replace with function body.

func _on_control_2_counter_zero() -> void:
	current_parent = STAT
	pass # Replace with function body.
