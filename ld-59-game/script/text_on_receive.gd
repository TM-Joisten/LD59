extends Control
@onready var msg_label: Label = $Label
@export var counter = 0

var txtGood = ["I'llbe damned, didnt know I could get 4k", "7:1 Lets Gooooo!", "Holy shit is this the Avatar sequel?"]
var txtMed = ["Finally the signal is back","Damn signal, I want to watch National Geographics in high quality!", "Is this some older footage?"]
var txtBad = ["This is so bad, i know comics with more frames!","I really should've gotten a cabel connection","I should maybe go for a walk today instead"]


var rng =RandomNumberGenerator.new()
var Text: String


func reciever_text() -> void: #
	rng.randomize()
	var ig = rng.randi_range(0,txtGood.size()-1)
	var im = rng.randi_range(0,txtMed.size()-1)
	var ib = rng.randi_range(0,txtBad.size()-1)
	
	if counter < 75 && counter > 30:
		Text = txtMed[im]
	elif counter <=30:
		Text = txtBad[ib]
	else:
		Text = txtGood[ig]
	
	
	var randomStr  = Text
	
	msg_label.text = randomStr
	
	await get_tree().create_timer(5).timeout
	msg_label.text = ""
	
