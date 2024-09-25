extends Node2D
 
@onready var score_label = $CanvasLayer/VBoxContainer/LevelScore as Label 
@onready var total_score_label = $CanvasLayer/VBoxContainer/TotalScore as Label
@onready var button = $CanvasLayer/VBoxContainer/Button as Button
const MENU_PATH = "res://Menus/HighScoreMenu.tscn"

var score
var level
var next_level

const MINIMUM_SCORE = 7000
const LAST_LEVEL = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score_label.text = str("LEVEL SCORE: ", score,)
	total_score_label.text = str("TOTAL SCORE: ", ScoreSystem.total_score)
	
	if score >= MINIMUM_SCORE and level < LAST_LEVEL:
		button.text = "Next Level"
		next_level = "res://Levels/level%s.tscn"%[level+1]
	elif score < MINIMUM_SCORE:
		button.text = "Try Again"
		next_level = MENU_PATH
	elif score >= MINIMUM_SCORE and level == LAST_LEVEL:
		score_label.text = str("LEVEL SCORE: ", score, "\nYOU BEAT THE GAME!!!")
		button.text = "Back to Menu"
		next_level = MENU_PATH
	print(next_level)
	button.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if button.text == "Try Again" or level == LAST_LEVEL:
		ScoreSystem.resetScore()
	get_tree().change_scene_to_file(next_level)
