extends Node2D

const MENU_PATH = "res://Menus/Menu.tscn"
@onready var back_button = $CanvasLayer/VBoxContainer/Button as TextureButton
var scores
@onready var tag_name = $CanvasLayer/VBoxContainer/HBoxContainer/TagName as Label
@onready var score_label = $CanvasLayer/VBoxContainer/HBoxContainer/Score_label as Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scores = ScoreSystem.high_scores
	for score in scores:
		tag_name.text = tag_name.text +"\n"+ score[0]+ "     "
		score_label.text = score_label.text +"\n     "+ str(score[1])
	back_button.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(MENU_PATH)
