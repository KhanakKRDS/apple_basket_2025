extends CharacterBody2D

var score_label: Label

func _ready():
	velocity = Vector2(0, 300)
	score_label = get_node("/root/BetterApples/score_bg/score")

func _physics_process(delta: float) -> void:
	move_and_slide()

	# Missed apple
	if position.y > 680:
		reset_apple()
		Global.score = max(Global.score - 1, 0)
		score_label.text = "Score: " + str(Global.score)

func reset_apple():
	position.x = randi_range(0, 1100)
	position.y = 0
	
func checkforwin (score: int):
		if score >= 1:
			get_tree().change_scene_to_file("res://endscreen.tscn")
