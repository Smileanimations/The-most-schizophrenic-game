extends Area2D

@export var speed = 400
var screen_size
@export var Health = 20
@onready var Healthbar = $Healthbar

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	Healthbar.max_value = Health
	Healthbar.value = Health


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$Playersprite.play()
	else :
		$Playersprite.stop()
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0:
		$Playersprite.animation = "walk"
		$Playersprite.flip_v = false
		$Playersprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$Playersprite.animation = "up"
		$Playersprite.flip_v = velocity.y > 0

