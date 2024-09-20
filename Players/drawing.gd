extends Node2D

@onready var _lines: Node = $Line2D

var pressed : bool = false
var current_line : Line2D = null
var brush = null

var red = false
var blue = false
var green = false

func _ready() -> void:
	brush = get_tree().get_first_node_in_group("brush")

# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("red_color"):
		paint(Color.RED)
		red = true
		blue = false
		green = false
	elif Input.is_action_just_pressed("green_color"):
		paint(Color.GREEN)
		red = false
		blue = false
		green = true
		
	elif Input.is_action_just_pressed("blue_color"):
		paint(Color.BLUE)
		red = false
		blue = true
		green = false
	
	if Input.is_action_just_released("red_color") and red:
		red = false
	elif Input.is_action_just_released("green_color") and green:
		green = false
	elif Input.is_action_just_released("blue_color") and blue:
		blue = false
		
		
	if red or blue or green:
		current_line.add_point(brush.global_position)

func paint(color):
	current_line = Line2D.new()
	current_line.default_color = color
	current_line.width = 5
	_lines.add_child(current_line)
	current_line.add_point(brush.global_position)
