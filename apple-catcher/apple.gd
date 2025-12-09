extends CharacterBody2D

var score_label: Label

func _ready():
	velocity = Vector2(0, 300) # x and y position
	score_label = get_node("/root/BetterApples/score")

func _physics_process(delta: float) -> void:
	if position.y >680:
		position.x = randi_range(0, 1100)
		position.y = 0
		

	move_and_slide()

	# Missed apple
	if position.y > 680:
		reset_apple()
		# Decrease score if missed
		var score = int(score_label.text)
		score = max(score - 1, 0)  # prevent negative score
		score_label.text = str(score)

func reset_apple():
	position.x = randi_range(0, 1100)
	position.y = 0
