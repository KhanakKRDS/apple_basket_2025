extends Node2D


func _on_play_again_pressed() -> void:
			get_tree().change_scene_to_file("res://better_apples.tscn")




func _on_mainmenu_2_pressed() -> void:
			get_tree().change_scene_to_file("res://start_screen.tscn")
