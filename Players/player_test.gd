extends CharacterBody2D

const SPEED = 100.0

const MAX_POINTS = 100.0
var bullet_point = 1.0
var points = 0.0
var lost_points = 0.0

var draw_zone = 0
var painting = false
var player_error = 0

@onready var sprite = $Sprite2D as Sprite2D
const RED_SPRITE = preload("res://Art/Pencil/LAPIS_vermelho.png")
const YELLOW_SPRITE = preload("res://Art/Pencil/LAPIS_amarelo.png")
const BLUE_SPRITE = preload("res://Art/Pencil/LAPIS_azul.png")
const WHITE_SPRITE = preload("res://Art/Pencil/LAPIS_branco.png")
const PURPLE_SPRITE = preload("res://Art/Pencil/LAPIS_roxo.png")
const PINK_SPRITE = preload("res://Art/Pencil/LAPIS_rosa.png")
const GREEN_SPRITE = preload("res://Art/Pencil/LAPIS_verde.png")

const NEGATIVE_POINT_PATH = preload("res://Points/Negative Points.tscn")

var clock
var current_bullets
var game_ended = false

var animation

func _ready() -> void:
	clock = get_tree().get_first_node_in_group("timer")
	var bullets = get_tree().get_node_count_in_group("positive_point")
	current_bullets = bullets
	bullet_point = MAX_POINTS / bullets
	animation = get_tree().get_first_node_in_group("animation")

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_h := Input.get_axis("ui_left", "ui_right")
	if direction_h:
		velocity.x = direction_h * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if global_position.x < 391:
		global_position.x = 391
	elif global_position.x > 965:
		global_position.x = 965
	
	var direction_v := Input.get_axis("ui_up", "ui_down")
	if direction_v:
		velocity.y = direction_v * SPEED
	else:
		velocity.y = move_toward(velocity.x, 0, SPEED)
		
	if global_position.y < 265:
		global_position.y = 265
	elif global_position.y > 840:
		global_position.y = 840
		
	if Input.is_action_pressed("red_color") and not Input.is_action_pressed("blue_color") and not Input.is_action_pressed("white_color"):
		painting = true
		sprite.texture = RED_SPRITE
	elif Input.is_action_pressed("yellow_color") and not Input.is_action_pressed("blue_color") and not Input.is_action_pressed("white_color"):
		painting = true
		sprite.texture = YELLOW_SPRITE
	elif Input.is_action_pressed("blue_color") and not Input.is_action_pressed("red_color") and not Input.is_action_pressed("yellow_color"):
		painting = true
		sprite.texture = BLUE_SPRITE
	elif Input.is_action_pressed("white_color") and not Input.is_action_pressed("red_color") and not Input.is_action_pressed("yellow_color"):
		painting = true
		sprite.texture = WHITE_SPRITE
	elif Input.is_action_pressed("red_color") and Input.is_action_pressed("blue_color"):
		painting = true
		sprite.texture = PURPLE_SPRITE
	elif Input.is_action_pressed("red_color") and Input.is_action_pressed("white_color"):
		painting = true
		sprite.texture = PINK_SPRITE
	elif Input.is_action_pressed("yellow_color") and Input.is_action_pressed("blue_color") :
		painting = true
		sprite.texture = GREEN_SPRITE
	elif Input.is_action_pressed("yellow_color") and Input.is_action_pressed("white_color"):
		painting = true
	else:
		painting = false

	if draw_zone == 0 and painting:
		animation.play("angry")
		if player_error == 0:
			losePoint()
	else:
		animation.play("default")
	
	timerPontuation()

	move_and_slide()


func gainPoint():
	points += bullet_point
	current_bullets -= 1


func losePoint():
	var negative_point = NEGATIVE_POINT_PATH.instantiate()
	get_parent().add_child(negative_point)
	negative_point.global_position= global_position
	
	lost_points += bullet_point * 5

func timerPontuation():
	if current_bullets <= 0:
		var timer_points =  clock.timer.time_left
		clock.timer.paused = true
		endLevel(timer_points)

func endLevel(timer_points = 0):
	if not game_ended:
		points = int((points + timer_points - lost_points) * 100) 
		if points <= 0:
			points = 0
		game_ended = true
		get_parent().endLevel(points)
