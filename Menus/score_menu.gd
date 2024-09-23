extends Node2D
 
@onready var score_label = $CanvasLayer/Label as Label 

var score

var level
var next_level

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score_label.text = str("SCORE: ", score)
	next_level = "res://Levels/level%s.tscn"%[level+1]
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(next_level)
