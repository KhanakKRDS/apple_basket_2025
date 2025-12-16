extends Area2D

var score_label: Label

func _ready():

	score_label = get_node("/root/BetterApples/score_bg/score")
	score_label.text = "Score: " + str(Global.score)


func _process(delta):
	
	if Input.is_key_pressed(KEY_LEFT):
		if position.x >= 0:
			position.x -= 10
	elif Input.is_key_pressed(KEY_RIGHT):
		if position.x <= 1100:
			position.x += 10

	if Input.is_key_pressed(KEY_A):
		if position.x >= 0:
			position.x -= 10
	if Input.is_key_pressed(KEY_D):
		if position.x <= 1100:
			position.x += 10


func _on_body_entered(body: Node) -> void:
	print(body.name,"*")
	if body.name == "apple":
		$AudioStreamPlayer_apple.play()

	elif body.name == "stone":
		$AudioStreamPlayer_stone.play()

	elif body.name == "star":
		$AudioStreamPlayer_star.play()

		

	if body.has_method("reset_apple"):
		Global.score += 1                        
		score_label.text = "Score: " + str(Global.score)
		body.reset_apple()
