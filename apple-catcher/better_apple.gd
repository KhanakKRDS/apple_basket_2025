extends CharacterBody2D

func _ready():
	velocity = Vector2(0, 200) # x and y position

func _physics_process(delta: float) -> void:
	if position.y >600:
		position.x = randi_range(0, 1100)
		position.y = 0
		
	move_and_slide()
