extends Area2D

@export var speed = 400
@export var Health = 20
@onready var Healthbar = $Healthbar
@onready var Bscene = preload("res://Attacks/bubble_attack.tscn")
var screen_size
var cooldown = false
var velocity = Vector2.ZERO

func _ready():
	#Sets the screensize to a set size so it cant change when entering full screen
	screen_size = get_viewport_rect().size
	Healthbar.max_value = Health
	Healthbar.value = Health

func _process(delta):
	#Basic movement of Mizustune
	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	
	#Sets the speed of Mizustune
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	#Clamps the speed so when 2 inputs are pressed at the same time they dont add eachother
	position += velocity * delta
	#Sets a border around the screen so Mizustune can't leave the screen
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0:
		$Playersprite.animation = "walk"
		$Playersprite.flip_v = false #Prevents Mizstune from turning upside down
		$Playersprite.flip_h = velocity.x < 0 #Turns Mizustune Left and Right
	elif velocity.y != 0:
		$Playersprite.animation = "up"
		$Playersprite.flip_v = velocity.y > 0 #Flips Mizustune Up and Down
	
	#When 'J' is pressed triggers the Bubbleblight function 
	if Input.is_action_pressed("bubbleblight"):
		bubbleblight()

#Causes bubbles to shoot from mizustune 
func bubbleblight():
	if !cooldown:
		#Causes for only 3 bubbles to shoot out
		for n in 3:
			#Instances the scene that handles all the bubble code
			var Bubblechild = Bscene.instantiate()
			add_child(Bubblechild)
		cooldown = true
	#Starts the 0.5 second cooldown
	$Timer.start()

func _on_timer_timeout():
	cooldown = false
