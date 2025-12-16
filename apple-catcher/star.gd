extends CharacterBody2D
var score_label : Label
var min_x = 0 # position of stars
var max_x = 1145 # position of stars
var num_stars = 1 #number of stars visible on screen at a time
var new_stars = [] # stores sll the new stars made
#var star = 0
#var power_up = new_stars[0]
@onready var timer: Timer = $Timer # 30s timer
#@onready var power_up: Sprite2D = $star_image # power up star


func _ready():
	_multiple_stars(num_stars)
	timer.wait_time = 30
	timer.start()
	timer.timeout.connect(_on_timer_timeout)
	score_label = get_node("/root/BetterApples/score_bg/score")
	
	for star in new_stars:
		star.visible = false # starts with false
		star.position = Vector2(randf_range(min_x, max_x), 0)


func _physics_process(delta: float) -> void:
	for star in new_stars:
		star.velocity = Vector2(0, 300) # moves down
		star.move_and_slide()

func _multiple_stars(num_stars):
	for i in range(num_stars):
		#sprite for star image
		var star = CharacterBody2D.new() #making new CharaterBody
		var sprite = Sprite2D.new() #making new Sprite2D
		sprite.texture = preload("res://star.png") #duplicate of this image
		sprite.scale = Vector2(0.35, 0.35) # size of the star
		star.name = ("Star")
		star.add_child(sprite) # adding the new star sprite image as its child of the original star
		

		#collision layer for each star
		var shape = CollisionShape2D.new()
		shape.shape = RectangleShape2D.new()
		#size of collision shape
		shape.shape.extents = sprite.texture.get_size() * sprite.scale * 0.5
		star.add_child(shape)

		#star's position and initial velocity
		star.position = Vector2(randf_range(min_x, max_x), randf_range(0,600)) 
		star.visible = false
		#star.velocity = Vector2(0, 200)

		#add new star to the node scene
		add_child(star)
		new_stars.append(star)
		#connect the star with basket
		var basket = get_node("basket")
		star.connect("body_entered", Callable(basket, "_on_body_entered"))

#visbility of the star(power up)	add a for loop to make the array of each part visible
func _on_timer_timeout() -> void:
	for star in new_stars:
		star.position = Vector2(randf_range(min_x, max_x), 0)
		print("working")
		star.visible = true

	await get_tree().create_timer(5).timeout
	for star in new_stars:
		star.visible = false
func _on_body_Star_entered(body):
	if body.name == ("Star"):
		Global.score =+ 5
		score_label.text = "Score: " + str(Global.score)
