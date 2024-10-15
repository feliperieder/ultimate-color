extends Node2D
 
@onready var score_label = $CanvasLayer/VBoxContainer/LevelScore as Label 
@onready var total_score_label = $CanvasLayer/VBoxContainer/TotalScore as Label
@onready var button = $CanvasLayer/VBoxContainer/Button as TextureButton
const LEVEL_SELECTION_PATH = "res://Menus/level_selection.tscn"
const HIGH_SCORE_PATH = "res://Menus/HighScoreMenu.tscn"

const QUIT_NORMAL = preload("res://Art/Buttons/Quit/botao_sair_normal.png")
const QUIT_FOCUSES = preload("res://Art/Buttons/Quit/botao_sair_hover.png")
const QUIT_PRESSED = preload("res://Art/Buttons/Quit/botao_sair_apertado.png")

const NEXTLVL_NORMAL = preload("res://Art/Buttons/NextLevel/botao_proxima_fase.png")
const NEXTLVL_FOCUSES = preload("res://Art/Buttons/NextLevel/botao_proxima_fase_hover.png")
const NEXTLVL_PRESSED = preload("res://Art/Buttons/NextLevel/botao_proxima_fase_apertado.png")

var names = ["Uni", "Duni", "Rieder", "Foguinho", "Unibo", "Ettin"]

var score
var level
var next_level

const MINIMUM_SCORE = 7000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score_label.text = str("LEVEL SCORE: ", score,)
	
	if Global.campaign_mode:
		total_score_label.text = str("TOTAL SCORE: ", ScoreSystem.total_score)
		
		if score >= MINIMUM_SCORE and not Global.late_levels.is_empty():
			nextLevelButton()
		elif score < MINIMUM_SCORE:
			quitButton()
		elif score >= MINIMUM_SCORE and Global.late_levels.is_empty():
			quitButton()
			score_label.text = str("LEVEL SCORE: ", score, "\nYOU BEAT THE GAME!!!")
			
	else:
		quitButton()
		
	button.grab_focus()

func nextLevelButton():
		button.texture_focused = NEXTLVL_FOCUSES
		button.texture_normal = NEXTLVL_NORMAL
		button.texture_pressed = NEXTLVL_PRESSED
		if level < 3:
			next_level = "res://Levels/level%s.tscn"%[level+1]
		else:
			var nlvl = Global.selectLateLvl()
			next_level = "res://Levels/level%s.tscn"%[nlvl]

func quitButton():
		button.texture_focused = QUIT_FOCUSES
		button.texture_normal = QUIT_NORMAL
		button.texture_pressed = QUIT_PRESSED
		if Global.campaign_mode:
			next_level = HIGH_SCORE_PATH
		else:
			next_level = LEVEL_SELECTION_PATH
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if next_level == HIGH_SCORE_PATH:
		var rand_name = names.pick_random()
		ScoreSystem.resetScore(rand_name)
	get_tree().change_scene_to_file(next_level)
