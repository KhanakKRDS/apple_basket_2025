extends CharacterBody2D

var min_x = 0 # position of stones
var max_x = 1152 # position of stones
var num_stones = 4 #number of stones visible on screen at a time
var new_stones = [] # stores sll the new stones made


func _ready():
	_multiple_stones(num_stones)
	
func _physics_process(delta: float) -> void:
	for stone in new_stones:
		stone.velocity = Vector2(0, 100) # moves down
		stone.move_and_slide()
		
		#resets the stone to zero if the stone is outside the screen
		if stone.position.y >648:
			stone.position.x = randf_range(min_x, max_x)
			stone.position.y = 0
	
func _multiple_stones(num_stones):
	for i in range(num_stones):
		#sprite for stone image
		var stone = CharacterBody2D.new()
		var sprite = Sprite2D.new()
		sprite.texture = preload("res://stone.png") 
		sprite.scale = Vector2(0.104, 0.134) # size of the stone
		stone.add_child(sprite) # adding the new stone sprite image as its child of the original stone
		
		#collision layer for each stone
		var shape = CollisionShape2D.new()
		shape.shape = RectangleShape2D.new()
		shape.shape.extents = sprite.texture.get_size() * sprite.scale * 0.5
		stone.add_child(shape)
		
		#stone's position and initial velocity
		stone.position = Vector2(randf_range(min_x, max_x), randf_range(0,600)) 
		stone.velocity = Vector2(0, 200)
	
		#connecting to increase the score
		add_child(stone)
		new_stones.append(stone)
		var basket = get_node("basket")
		stone.connect("body_entered", Callable(basket, "_on_body_entered"))
