extends CharacterBody2D


const SPEED = 100.0

const MAX_POINTS = 100.0
var bullet_point = 1.0
var points = 0.0
var lost_points = 0.0

var error_layer = 0
var painting = false
var player_error = 0

const NEGATIVE_POINT_PATH = preload("res://Points/Negative Points.tscn")

func _ready() -> void:
	print(bullet_point)
	var bullets = get_tree().get_node_count_in_group("positive_point")
	print(bullets)
	bullet_point = MAX_POINTS / bullets
	print(bullet_point)


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
		
	if Input.is_action_pressed("blue_color") or Input.is_action_pressed("red_color") or Input.is_action_pressed("green_color"):
		painting = true
	else:
		painting = false

	if error_layer != 0 and painting and player_error == 0:
		losePoint()

	move_and_slide()


func gainPoint():
	points += bullet_point


func losePoint():
	var negative_point = NEGATIVE_POINT_PATH.instantiate()
	get_parent().add_child(negative_point)
	negative_point.global_position= global_position
	
	lost_points += bullet_point/2

func endLevel():	
	points -= lost_points
	if points <= 0:
		points = 0
	print("Comic Sans:", points)
