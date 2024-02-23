extends Node2D

func _on_area_2d_body_entered(body: Node2D):
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Scenes/level_selection.tscn")
