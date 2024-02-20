extends CharacterBody2D
# template did not make myself.

@export var speed : float = 200
@export var jump_velocity : float = -200
@export var double_jump_velocity : float = -150

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var has_double_jumped : bool = false
var animation_locked : bool = false
var direction : Vector2 = Vector2.ZERO
var in_air : bool = false
var is_running : bool = false

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		in_air = true
	else:
		has_double_jumped = false
		if in_air == true:
			land()

		in_air = false
	# Handle Jump.
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			#normal jump from floor
			jump()
		elif not has_double_jumped:
			#double jump in air
			double_jump()
			
			

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("left", "right", "up", "down")
	
	if direction.x != 0 && animated_sprite.animation != "land":
		velocity.x = direction.x * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	update_animation()
	update_facing_direction()
	
func update_animation():
	if not animation_locked:
		if not is_on_floor():
			animated_sprite.play("jump_air")
		else:
			if direction.x != 0:
				animated_sprite.play("walk")
			else:
				animated_sprite.play("idle")
				
		
func update_facing_direction():
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true

func jump():
	velocity.y = jump_velocity
	animated_sprite.play("jump_start")
	animation_locked = true

func double_jump():
	velocity.y = double_jump_velocity
	animated_sprite.play("jump_loop")
	animation_locked = true
	has_double_jumped = true

func land():
	animated_sprite.play("land")
	animation_locked = false

func _on_animated_sprite_2d_animation_finished():
	if(["jump_start", "land", "double_jump()"].has(animated_sprite.animation)):
		animation_locked = false
		
func _on_animated_sprite_2d_animation_changed():
	pass
