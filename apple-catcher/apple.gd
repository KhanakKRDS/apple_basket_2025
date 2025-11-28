extends Sprite2D

var y_pos = 0
var x_pos = 500
func _ready():
	print("Hello world")
	
func _process(delta):
	y_pos = y_pos + 1
	print(y_pos)
	
	position = Vector2(x_pos, y_pos)
	#randi_range(50, 1000)
	
	if y_pos > 650:
		y_pos = 0
		x_pos = randi_range(50, 1000)
		#position = Vector2(x_pos,y_pos)
		print("outside of the screen")
	
	
		
