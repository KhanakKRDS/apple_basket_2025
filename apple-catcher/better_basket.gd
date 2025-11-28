extends Area2D

var score = 0
var score_label

func _ready(): # runs only one time
	score_label = get_node("/root/BetterApples/score") # path of the score
	
func _process(delta):
	if Input.is_key_pressed(KEY_LEFT):
		position.x -=5 
		
	elif  Input.is_key_pressed(KEY_RIGHT):
		position.x +=5
		

func _on_body_entered(body: Node2D) -> void:
	print("You are touching me")
	score += 1 
	score_label.text = str(score)
