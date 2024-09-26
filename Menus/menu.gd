extends Node2D

const FIRST_LEVEL_PATH = "res://main.tscn"
const CREDITS_PATH = "res://Menus/HighScoreMenu.tscn"
const TUTORIAL_PATH = "res://Menus/TutorialMenu.tscn"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/HBoxContainer/Start.grab_focus()
	Music.playMenuMusic()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	Music.playLevelMusic()
	get_tree().change_scene_to_file(FIRST_LEVEL_PATH)


func _on_score_pressed() -> void:
	get_tree().change_scene_to_file(CREDITS_PATH)


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_how_to_play_pressed() -> void:
	get_tree().change_scene_to_file(TUTORIAL_PATH)
