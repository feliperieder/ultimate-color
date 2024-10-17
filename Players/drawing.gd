extends Node2D

@onready var _lines: Node = $Line2D

var pressed : bool = false
var current_line : Line2D = null
var brush = null

var red = false
var yellow = false
var blue = false
var white = false

var drawing = false

const COLOR_RED = Color(0.675, 0.196, 0.196)
const COLOR_YELLOW = Color(0.882, 0.729, 0.09)
const COLOR_BLUE = Color(0.388, 0.608, 1)
const COLOR_WHITE = Color(0.729, 0.792, 0.914)
const COLOR_PURPLE = Color(0.463, 0.259, 0.541)
const COLOR_PINK = Color.HOT_PINK
const COLOR_GREEN = Color(0.294, 0.412, 0.184)
const COLOR_LIGHT_YELLOW = Color.LIGHT_GOLDENROD

var level_finished = false

func _ready() -> void:
	brush = get_tree().get_first_node_in_group("brush")
	level_finished = false

# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("red_color"):
		red = true
		yellow = false
		if blue or Input.is_action_pressed("blue_color"):
			paint(COLOR_PURPLE)
		elif white or Input.is_action_pressed("white_color"):
			paint(COLOR_PINK)
		else:
			paint(COLOR_RED)
		
	elif Input.is_action_just_pressed("yellow_color"):
		red = false
		yellow = true
		if blue or Input.is_action_pressed("blue_color"):
			paint(COLOR_GREEN)
		elif white or Input.is_action_pressed("white_color"):
			paint(COLOR_LIGHT_YELLOW)
		else:
			paint(COLOR_YELLOW)
	
		
	if Input.is_action_just_pressed("blue_color"):
		blue = true
		white = false
		if red or Input.is_action_pressed("red_color"):
			paint(COLOR_PURPLE)
		elif yellow or Input.is_action_pressed("yellow_color"):
			paint(COLOR_GREEN)
		else:
			paint(COLOR_BLUE)
		
	elif Input.is_action_just_pressed("white_color"):
		blue = false
		white = true
		if red or Input.is_action_pressed("red_color"):
			paint(COLOR_PINK)
		elif yellow or Input.is_action_pressed("yellow_color"):
			paint(COLOR_LIGHT_YELLOW)
		else:
			paint(COLOR_WHITE)

	if Input.is_action_just_released("red_color") and red:
		red = false
		if blue and Input.is_action_pressed("blue_color"):
			paint(COLOR_BLUE)
		elif white and Input.is_action_pressed("white_color"):
			paint(COLOR_WHITE)
		else: 
			finishingLine()
	elif Input.is_action_just_released("yellow_color") and yellow:
		yellow = false
		if blue and Input.is_action_pressed("blue_color"):
			paint(COLOR_BLUE)
		elif white and Input.is_action_pressed("white_color"):
			paint(COLOR_WHITE)
		else: 
			finishingLine()
	if Input.is_action_just_released("blue_color") and blue:
		blue = false
		if red and Input.is_action_pressed("red_color"):
			paint(COLOR_RED)
		elif yellow and Input.is_action_pressed("yellow_color"):
			paint(COLOR_YELLOW)
		else: 
			finishingLine()
	elif Input.is_action_just_released("white_color") and white:
		white = false
		if red and Input.is_action_pressed("red_color"):
			paint(COLOR_RED)
		elif yellow and Input.is_action_pressed("yellow_color"):
			paint(COLOR_YELLOW)
		else: 
			finishingLine()
	
	if (red or blue or yellow or white) and not level_finished:
		current_line.add_point(brush.global_position)
		drawing = true
	else: drawing = false

func paint(color):
	if not level_finished:
		current_line = Line2D.new()
		current_line.default_color = color
		current_line.width = 10
		_lines.add_child(current_line)
		current_line.add_point(brush.global_position - Vector2(0,5))
		current_line.add_point(brush.global_position + Vector2(0,5))

func finishingLine():
	pass
