extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	#Sets the speed and direction for the bubbles when impulse is triggered
	var facing = get_parent().velocity
	var speed = get_parent().speed
	#Gives the bubbles the initial push that propells them to the facing direction
	apply_impulse(Vector2(facing.x,facing.y)) 
	bubbledata(facing,speed)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func bubbledata(facing,speed):
	print ("X = %d" % facing.x)
	print ("Y = %d" % facing.y)
	print ("Bubble Speed = %d" % speed)
