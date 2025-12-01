extends Node2D

func _ready():
	$"start button".pressed.connect(_on_start_pressed)

func _on_start_pressed():
	get_tree().change_scene_to_file("res://better_apples.tscn")
