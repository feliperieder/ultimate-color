extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_h := Input.get_axis("ui_left", "ui_right")
	if direction_h:
		velocity.x = direction_h * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	var direction_v := Input.get_axis("ui_up", "ui_down")
	if direction_v:
		velocity.y = direction_v * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
