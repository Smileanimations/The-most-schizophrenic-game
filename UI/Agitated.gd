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

func _on_timer_timeout():
	agitated.value += 1
	enranged()
	if agitated.value == 100:
		timer.stop()


func enranged():
	if agitated.value == 100:
		$Agitatedeye.animation = "enraged"
		playSound("Roar")
		playSound("Theme")
func playSound(sound):
	var instance = audio.instantiate()
	instance.startup(sound)
	add_child(instance)
