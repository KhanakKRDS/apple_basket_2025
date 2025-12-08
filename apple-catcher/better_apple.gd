extends Node2D

var score_label: Label
var min_x = 20 # position of apples
var max_x = 1150 # position of apples
var num_apples = 2 #number of apples visible on screen at a time
var new_apples = [] # stores sll the new apples made

func _ready_():
	score_label = get_node("/root/BetterApples/score")
func _ready():
	_multiple_apples(num_apples)
	
func _physics_process(delta: float) -> void:
		for apple in new_apples:
			apple.velocity = Vector2(0, 100) # moves down
			apple.move_and_slide()
			
			#resets the apple to zero if the apple is outside the screen
			if apple.position.y >680:
					  
					apple.position.x = randf_range(min_x,max_x)
					apple.position.y=0
			
			
func _multiple_apples(num_apples):
		for i in range(num_apples):
			#sprite for apple image
			var apple = CharacterBody2D.new()
			var sprite = Sprite2D.new()
			sprite.texture = preload("res://apple.png") 
			sprite.scale = Vector2(0.162, 0.158) # size of the apple
			apple.add_child(sprite) # adding the new apple sprite image as its child of the original apple
			
			#collision layer for each apple
			var shape = CollisionShape2D.new()
			shape.shape = RectangleShape2D.new()
			shape.shape.extents = sprite.texture.get_size() * sprite.scale * 0.5
			apple.add_child(shape)
			
			#apple's position and initial velocity
			apple.position = Vector2(randf_range(min_x, max_x), randf_range(0,600)) 
			apple.velocity = Vector2(0, 200)
		
			#connecting to increase the score
			add_child(apple)
			new_apples.append(apple)
			var basket = get_node("basket")
			apple.connect("body_entered", Callable(basket, "_on_body_entered"))
			
