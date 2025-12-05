extends CharacterBody2D

var min_x = 0 # position of stars
var max_x = 1145 # position of stars
var num_stars = 1 #number of stars visible on screen at a time
var new_stars = [] # stores sll the new stars made
var star = 0
@onready var timer: Timer = $Timer # 30s timer
@onready var power_up: Sprite2D = $star_image # power up star


func _ready():
	_multiple_stars(num_stars)
	timer.timeout.connect(_on_timer_timeout)
	power_up.visible = false # starts with false

	
func _physics_process(delta: float) -> void:
	for star in new_stars:
		star.velocity = Vector2(0, 100) # moves down
		star.move_and_slide()
		
		#resets the star to zero if the star is outside the screen
		#if star.position.y >648:
			#star.position.x = randf_range(min_x, max_x)
			#star.position.y = 0
			
	
func _multiple_stars(num_stars):
	for i in range(num_stars):
		#sprite for star image
		var star = CharacterBody2D.new() #making new CharaterBody
		var sprite = Sprite2D.new() #making new Sprite2D
		sprite.texture = preload("res://star.png") #duplicate of this image
		sprite.scale = Vector2(0.35, 0.35) # size of the star
		star.add_child(sprite) # adding the new star sprite image as its child of the original star
		
		#collision layer for each star
		var shape = CollisionShape2D.new()
		shape.shape = RectangleShape2D.new()
		#size of collision shape
		shape.shape.extents = sprite.texture.get_size() * sprite.scale * 0.5
		star.add_child(shape)
		
		#star's position and initial velocity
		star.position = Vector2(randf_range(min_x, max_x), randf_range(0,600)) 
		star.velocity = Vector2(0, 200)
	
		#add new star to the node scene
		add_child(star)
		new_stars.append(star)
		#connect the star with basket
		var basket = get_node("basket")
		star.connect("body_entered", Callable(basket, "_on_body_entered"))

#visbility of the star(power up)	
func _on_timer_timeout() -> void:
	if power_up.visible == true:
		power_up.show()
		

	else:
		power_up.hide()
		
