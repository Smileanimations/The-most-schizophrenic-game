extends Control
@onready var timer = $Enragetimer
@onready var agitated = $agitatorbar
var audio = preload("res://UI/Audiostreamer.tscn")



# Called when the node enters the scene tree for the first time.
func _ready():
	#Resets the rage icon to its default yellow color
	$Agitatedeye.animation = "default"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#Sets the default rage status to false
var isRage = false
#Sets the default rage value to 0
var agValue = 0

func _on_timer_timeout():
	#If mizu is not enraged add 1 to the enrage value else subtract 4
	if not isRage:
		agValue += 1
	else:
		agValue -= 4
	agValue = clampi(agValue, 0, 200)
	#If the enrage value reaches 200 it triggers the enrage function 
	#else if it reaches 0 trigger the unenrage function
	if agValue >= 200:
		enranged()
	elif agValue <= 0:
		unenrage()
	#Lets the enragebar display the rage value
	agitated.value = agValue
func enranged():
	#Sets the rage status to true which then decreases the rage value
	isRage = true
	#Turns the rage icon red
	$Agitatedeye.animation = "enraged"
	#Plays Mizustune's roar
	playSound("Roar")
	#Handles the scene instancing for playing sounds
func playSound(sound):
	var instance = audio.instantiate()
	instance.startup(sound)
	add_child(instance)

func unenrage():
	#Sets the rage status to false which then increases the rage value
	isRage = false
	#Returns the rage icon to its default yellow color
	$Agitatedeye.animation = "default"
	



