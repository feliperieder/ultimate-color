extends Node2D

@onready var _lines: Node = $Line2D

var late_lines = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for line in get_tree().get_nodes_in_group("line"):
		await line.ready
		instanciateLine(line)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not late_lines.is_empty():
		if get_tree().get_node_count_in_group("visible_points") <= 200:
			for line in late_lines:
				line.show()

func instanciateLine(line):
	var new_line = Line2D.new()
	if line.is_in_group("late_line"):
		new_line.hide()
		late_lines.append(new_line)
	new_line.width = 2
	new_line.default_color = setColor(line.color)
	_lines.add_child(new_line)
	for point in line.get_point_count():
		new_line.add_point(line.get_point_position(point)/5)

func setColor(line_color):
	match line_color:
		"red": return Color(0.675, 0.196, 0.196)
		"yellow": return Color(0.882, 0.729, 0.09)
		"blue": return Color(0.388, 0.608, 1)
		"white": return Color(0.729, 0.792, 0.914)
		"purple": return Color(0.463, 0.259, 0.541)
		"pink": return Color.HOT_PINK
		"green": return Color(0.294, 0.412, 0.184)
		"light_yellow": return Color.LIGHT_GOLDENROD
