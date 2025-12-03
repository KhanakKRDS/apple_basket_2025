extends Area2D

var score_label: Label

func _ready():
	score_label = get_node("/root/BetterApples/score")

func _process(delta):
	if Input.is_key_pressed(KEY_LEFT):
		position.x -= 7
	if Input.is_key_pressed(KEY_RIGHT):
		position.x += 7

func _on_body_entered(body: Node) -> void:
	# Only reset apple if method exists
	if body.has_method("reset_apple"):
		var score = int(score_label.text)
		score += 1
		score_label.text = str(score)
		body.reset_apple()
