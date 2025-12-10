extends Button

func _ready():
	pressed.connect(_on_mainmenu_pressed)

func _on_mainmenu_pressed():
	get_tree().change_scene_to_file("res://start_screen.tscn")
