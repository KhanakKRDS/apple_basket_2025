extends Node2D

func _ready():
	$"start button".connect("pressed", Callable(self, "_on_start_pressed"))
	$TutorialPage.visible = false

func _on_start_pressed():
	$AudioStreamPlayer2D2.play()
	get_tree().change_scene_to_file("res://better_apples.tscn")

func _on_tutorial_button_button_down() -> void:
	$TutorialPage.visible = true

func _on_mainmenu_button_down() -> void:
	$TutorialPage.visible = false
