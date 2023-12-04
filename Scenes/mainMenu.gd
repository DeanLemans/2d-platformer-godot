extends Node2D

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/test_level.tscn")
#C:\Users\Dean\2d-platformer-godot\Levels

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/test_level.tscn")

func _on_quit_pressed():
	get_tree().quit()
