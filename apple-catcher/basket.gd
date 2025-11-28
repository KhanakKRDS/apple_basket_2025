extends Sprite2D

var x_pos = 0
func _ready():
	print("Hello world")
	
func _process(delta):
	
	if Input.is_key_pressed(KEY_RIGHT):
		x_pos = x_pos + 2
	
	elif Input.is_key_pressed(KEY_LEFT):
		x_pos = x_pos - 2
	
	position = Vector2(x_pos,55)
	
	
	
	
		
