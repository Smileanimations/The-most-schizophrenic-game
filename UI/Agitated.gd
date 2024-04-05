extends Control
@onready var timer = $Enragetimer
@onready var agitated = $agitatorbar
var audio = preload("res://UI/Audiostreamer.tscn")



# Called when the node enters the scene tree for the first time.
func _ready():
	$Agitatedeye.animation = "default"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var isRage = false
var agValue = 0
func _on_timer_timeout():
	if not isRage:
		agValue += 1
	else:
		agValue -= 4
	agValue = clampi(agValue, 0, 200)
	if agValue >= 200:
		enranged()
	elif agValue <= 0:
		unenrage()
	agitated.value = agValue
func enranged():
	isRage = true
	$Agitatedeye.animation = "enraged"
	playSound("Roar")
func playSound(sound):
	var instance = audio.instantiate()
	instance.startup(sound)
	add_child(instance)

func unenrage():
	isRage = false
	$Agitatedeye.animation = "default"
	



