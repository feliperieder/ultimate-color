extends Node2D
 
@onready var score_label = $CanvasLayer/Label as Label 

var score = 1000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score_label.text = str("SCORE: ", score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
