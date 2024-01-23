extends Node2D

var direction : Vector2 = Vector2.ZERO
var animation_player : AnimationPlayer



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	# Your existing direction checking logic
	if direction.x > 0:
		animation_player.scale.x = 1
	elif direction.x < 0:
		animation_player.scale.x = -1


func _on_area_2d_body_entered(body: Node2D):
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Scenes/lost.tscn")
