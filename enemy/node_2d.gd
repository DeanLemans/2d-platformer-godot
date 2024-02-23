extends Node2D

func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://Scenes/mainMenu.tscn")

func _on_area_2d_body_entered(body):
	get_tree().change_scene_to_file("res://enemy/lost.tscn")
