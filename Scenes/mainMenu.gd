extends Node2D

func _on_quit_pressed():
	get_tree().quit()

func _on_ambitie_pressed():
	get_tree().change_scene_to_file("res://Scenes/level_selection.tscn")

func _on_glow_pressed():
	get_tree().change_scene_to_file("res://Scenes/glowLevel.tscn")
	
#func _process(_delta):
	#if Input.is_action_pressed("ui_cancel"):
		#get_tree().quit()#
