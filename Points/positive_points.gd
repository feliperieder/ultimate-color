extends Area2D

@export var color = ""
var brush = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if brush and Input.is_action_pressed("%s_color" %[color]):
		brush.gainPoint()
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("brush"):
		brush = body


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("brush"):
		brush = false
