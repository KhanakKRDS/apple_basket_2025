extends CharacterBody2D
var apple = ("/root/BetterApples/apple/apple_image")
var min_x = 20
var max_x = 1150


func _ready():
	velocity = Vector2(0, 200) # x and y position
	_physics_process(5)

func _physics_process(delta: float) -> void:
	if position.y >600:
		position.x = randi_range(0, 1100)
		position.y = 0
		
	move_and_slide()
func _multiple_apples():
	var new_apple =  apple
	var random_x = randf_range(min_x, max_x)
	
	new_apple.position = Vector2(random_x,position.y >600) 
	
	
	
