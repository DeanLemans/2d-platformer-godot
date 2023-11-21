extends CharacterBody2D

var speed = 100
var detection_radius = 200
var player_in_range = false
var player_position = Vector2.ZERO

func _process(delta):
	if player_in_range:
		# Calculate the direction towards the player
		var direction = (player_position - global_position).normalized()

		# Move the enemy towards the player
		move_and_slide()
		

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		player_in_range = true

func _on_Area2D_body_exited(body):
	if body.is_in_group("player"):
		player_in_range = false

func _on_Area2D_area_entered(area):
	if area.is_in_group("player"):
		player_position = area.global_position

func _on_Area2D_area_exited(area):
	if area.is_in_group("player"):
		player_position = Vector2.ZERO
