extends CharacterBody2D

var min_x = 0 # position of stars
var max_x = 1152 # position of stars
var num_stars = 2 #number of stars visible on screen at a time
var new_stars = [] # stores sll the new stars made


func _ready():
	_multiple_stars(num_stars)
	
func _physics_process(delta: float) -> void:
	for star in new_stars:
		star.velocity = Vector2(0, 100) # moves down
		star.move_and_slide()
		
		#resets the star to zero if the star is outside the screen
		if star.position.y >648:
			star.position.x = randf_range(min_x, max_x)
			star.position.y = 0
	
func _multiple_stars(num_stars):
	for i in range(num_stars):
		#sprite for star image
		var star = CharacterBody2D.new()
		var sprite = Sprite2D.new()
		sprite.texture = preload("res://star.png") 
		sprite.scale = Vector2(0.35, 0.35) # size of the star
		star.add_child(sprite) # adding the new star sprite image as its child of the original star
		
		#collision layer for each star
		var shape = CollisionShape2D.new()
		shape.shape = RectangleShape2D.new()
		shape.shape.extents = sprite.texture.get_size() * sprite.scale * 0.5
		star.add_child(shape)
		
		#star's position and initial velocity
		star.position = Vector2(randf_range(min_x, max_x), randf_range(0,600)) 
		star.velocity = Vector2(0, 200)
	
		#connecting to increase the score
		add_child(star)
		new_stars.append(star)
		var basket = get_node("basket")
		star.connect("body_entered", Callable(basket, "_on_body_entered"))
