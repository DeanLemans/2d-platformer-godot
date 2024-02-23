extends Node2D

var direction : Vector2 = Vector2.ZERO
var animation_player : AnimationPlayer

func _on_area_2d_body_entered(body: Node2D):
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Scenes/lost.tscn")
