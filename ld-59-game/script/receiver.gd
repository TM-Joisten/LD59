extends Node2D
@export var R = 4.1*128
var PHI1 = 0

signal reach_goal

var T = float(Time.get_ticks_msec())/1e3
@export var Planet = Node2D
@onready var Sprite: AnimatedSprite2D = $AnimatedSprite2D
#@onready var Sig = $/root/state_manager/Signal as Node2D #get node of the item "signal"
@onready var Sig: Node2D = $"../Signal"

func change_place():		#rotates the reciever item
	PHI1 = randf_range(3/4*PI,15/4*PI)
	R = 530*Planet.scale.x
	self.global_position.x = Planet.global_position.x + R*cos(PHI1)
	self.global_position.y = Planet.global_position.y + R*sin(PHI1)
	Sprite.rotation = 0
	Sprite.rotate(get_angle_to(Planet.position)- PI/2)
	
	randomize()			#randomizez houses
	var animations_off = ["house1off", "house2off", "house3off"]
	var random_ani = animations_off[randi() % animations_off.size()]
	Sprite.play(random_ani)
	
	
	
func distance() -> float:
	var sigx = abs(global_position.x - Sig.global_position.x)
	var sigy = abs(global_position.y - Sig.global_position.y)
	return sigx + sigy

func _ready() -> void: #used for random position and random house
	
	change_place()
	
	pass	
	


func _process(float) -> void:
	if Planet.id() == "Moon" :
		R = 160*Planet.scale.x 
		self.global_position.x = Planet.global_position.x + R*cos(PHI1)
		self.global_position.y = Planet.global_position.y + R*sin(PHI1)
	var animations_on = ["house1on", "house2on", "house3on"]
	T = float(Time.get_ticks_msec())/1e3
	if distance() < 1.0:
		reach_goal.emit()
		if Sprite.animation == "house1off":
			Sprite.play("house1on")
		elif Sprite.animation == "house2off":
			Sprite.play("house2on")
		elif Sprite.animation == "house3off":
			Sprite.play("house3on")
		
			
		
