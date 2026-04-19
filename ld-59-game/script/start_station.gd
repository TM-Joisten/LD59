extends Node2D

@onready var Sprite: AnimatedSprite2D = $AnimatedSprite2D
#@onready var Sig = $/root/state_manager/Signal as Node2D #get node of the item "signal"
@onready var Sig: Node2D = $"../Signal"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Sprite.play("signal_on")
	print(Sprite.animation)

func distance() -> float:
	if Sig == null:
		return 0.0
	return global_position.distance_to(Sig.global_position)
# Called every frame. 'delta' is the elapsed time since the previous frame.


func _process(delta: float) -> void:
	#print(distance())
	if distance() > 1.0:
		Sprite.play("signal_off")
	else:
		Sprite.play("signal_on")
	pass	
