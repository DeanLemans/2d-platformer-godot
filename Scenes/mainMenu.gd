extends Node2D

func _on_playAmbitie_pressed():
	get_tree().change_scene_to_file("res://Scenes/ambitieLevel.tscn")
#res://Scenes/ambitieLevel.tscn

func _on_playGlow_pressed():
	get_tree().change_scene_to_file("res://Scenes/glowLevel.tscn")
#res://Scenes/glowLevel.tscn

func _on_quit_pressed():
	get_tree().quit()
