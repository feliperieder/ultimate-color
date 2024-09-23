extends Node2D

@onready var _lines: Node = $Line2D

var pressed : bool = false
var current_line : Line2D = null
var brush = null

var red = false
var yellow = false
var blue = false
var white = false

const COLOR_RED = Color.RED
const COLOR_YELLOW = Color.YELLOW
const COLOR_BLUE = Color.BLUE
const COLOR_WHITE = Color.WHITE
const COLOR_PURPLE = Color.PURPLE
const COLOR_PINK = Color.PINK
const COLOR_GREEN = Color.GREEN
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
		if blue:
			paint(COLOR_PURPLE)
		elif white:
			paint(COLOR_PINK)
		else:
			paint(COLOR_RED)
		
	elif Input.is_action_just_pressed("yellow_color"):
		red = false
		yellow = true
		if blue:
			paint(COLOR_GREEN)
		elif white:
			paint(COLOR_LIGHT_YELLOW)
		else:
			paint(COLOR_YELLOW)
		
	elif Input.is_action_just_pressed("blue_color"):
		blue = true
		white = false
		if red:
			paint(COLOR_PURPLE)
		elif yellow:
			paint(COLOR_GREEN)
		else:
			paint(COLOR_BLUE)
		
	elif Input.is_action_just_pressed("white_color"):
		blue = false
		white = true
		if red:
			paint(COLOR_PINK)
		elif yellow:
			paint(COLOR_LIGHT_YELLOW)
		else:
			paint(COLOR_WHITE)

	if Input.is_action_just_released("red_color") and red:
		red = false
		if blue:
			paint(COLOR_BLUE)
		elif white:
			paint(COLOR_WHITE)
		else: 
			finishingLine()
	elif Input.is_action_just_released("yellow_color") and yellow:
		yellow = false
		if blue:
			paint(COLOR_BLUE)
		elif white:
			paint(COLOR_WHITE)
		else: 
			finishingLine()
	elif Input.is_action_just_released("blue_color") and blue:
		blue = false
		if red:
			paint(COLOR_RED)
		elif yellow:
			paint(COLOR_YELLOW)
		else: 
			finishingLine()
	elif Input.is_action_just_released("white_color") and white:
		white = false
		if red:
			paint(COLOR_RED)
		elif yellow:
			paint(COLOR_YELLOW)
		else: 
			finishingLine()
		
	if (red or blue or yellow or white) and not level_finished:
		current_line.add_point(brush.global_position)
		

func paint(color):
	if not level_finished:
		current_line = Line2D.new()
		current_line.default_color = color
		current_line.width = 10
		_lines.add_child(current_line)
		current_line.add_point(brush.global_position - Vector2(0,5))
		current_line.add_point(brush.global_position + Vector2(0,5))

func finishingLine():
	if not level_finished:
		current_line.add_point(brush.global_position - Vector2(0,5))
		current_line.add_point(brush.global_position + Vector2(0,5))
