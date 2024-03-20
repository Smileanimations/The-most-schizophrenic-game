extends AudioStreamPlayer
var AudioDictionary = {
	"Roar" = preload("res://Sounds/MizustuneRoar.mp3"),
	"Theme" = preload("res://Sounds/Theme.mp3")
}

func startup(sound):
	stream = AudioDictionary[sound]


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_finished():
	queue_free()
