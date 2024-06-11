extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	#Sets the speed and direction for the bubbles when impulse is triggered
	var facing_x = get_parent().velocity.x + 200
	var facing_y = get_parent().velocity.y + 200
	
	#Gives the bubbles the initial push that propells them to the facing direction
	apply_impulse(Vector2(facing_x,facing_y)) 
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
