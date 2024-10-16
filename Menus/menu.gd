extends Node2D

const FIRST_LEVEL_PATH = "res://Levels/level1.tscn"
const CREDITS_PATH = "res://Menus/HighScoreMenu.tscn"
const TUTORIAL_PATH = "res://Menus/TutorialMenu.tscn"
const SELECTION_LEVEL_PATH = "res://Menus/level_selection.tscn"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/HBoxContainer/Start.grab_focus()
	Music.playMenuMusic()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	Global.campaign_mode = true
	Global.resetLevels()
	Music.playLevelMusic()
	get_tree().change_scene_to_file(FIRST_LEVEL_PATH)


func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_how_to_play_pressed() -> void:
	get_tree().change_scene_to_file(TUTORIAL_PATH)


func _on_level_select_pressed() -> void:
	get_tree().change_scene_to_file(SELECTION_LEVEL_PATH)
