extends Node2D

var direction : Vector2 = Vector2.ZERO
var animation_player : AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Your existing direction checking logic
	if direction.x > 0:
		animation_player.scale.x = 1
	elif direction.x < 0:
		animation_player.scale.x = -1


func _on_area_2d_area_entered(area):
	get_tree().change_scene_to_file("res://Scenes/lost.tscn")
	#
