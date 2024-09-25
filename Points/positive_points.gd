extends Area2D

@export var color = ""
var brush = null
var drawing

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	drawing = get_tree().get_first_node_in_group("drawing")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if brush:
		match color:
			"red":
				if drawing.red and not drawing.blue and not drawing.white:
					givePoint()
			"yellow":
				if drawing.yellow and not drawing.blue and not drawing.white:
					givePoint()
			"blue":
				if drawing.blue and not drawing.yellow and not drawing.red:
					givePoint()
			"white":
				if drawing.white and not drawing.red and not drawing.yellow:
					givePoint()
			"purple":
				if drawing.blue and drawing.red:
					givePoint()
			"green":
				if drawing.blue and drawing.yellow:
					givePoint()
			"pink":
				if drawing.red and drawing.white:
					givePoint()
			"light_yellow":
				if drawing.yellow and drawing.white:
					givePoint()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("brush"):
		brush = body

func givePoint():
	brush.gainPoint()
	queue_free()


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("brush"):
		brush = false
