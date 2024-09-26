extends Node2D
 
@onready var score_label = $CanvasLayer/VBoxContainer/LevelScore as Label 
@onready var total_score_label = $CanvasLayer/VBoxContainer/TotalScore as Label
@onready var button = $CanvasLayer/VBoxContainer/Button as TextureButton
const MENU_PATH = "res://Menus/HighScoreMenu.tscn"

const QUIT_NORMAL = preload("res://Art/Buttons/PlayAgain/botao_jogar_denovo_normal.png")
const QUIT_FOCUSES = preload("res://Art/Buttons/PlayAgain/botao_jogar_denovo_hover.png")
const QUIT_PRESSED = preload("res://Art/Buttons/PlayAgain/botao_jogar_denovo_apertado.png")

const NEXTLVL_NORMAL = preload("res://Art/Buttons/NextLevel/botao_proxima_fase.png")
const NEXTLVL_FOCUSES = preload("res://Art/Buttons/NextLevel/botao_proxima_fase_hover.png")
const NEXTLVL_PRESSED = preload("res://Art/Buttons/NextLevel/botao_proxima_fase_apertado.png")

var names = ["Uni", "Duni", "Rieder", "Foguinho", "Unibo", "Ettin"]

var score
var level
var next_level

const MINIMUM_SCORE = 7000
const LAST_LEVEL = 7

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score_label.text = str("LEVEL SCORE: ", score,)
	total_score_label.text = str("TOTAL SCORE: ", ScoreSystem.total_score)
	
	if score >= MINIMUM_SCORE and level < LAST_LEVEL:
		nextLevelButton()
	elif score < MINIMUM_SCORE:
		quitButton()
	elif score >= MINIMUM_SCORE and level == LAST_LEVEL:
		quitButton()
		score_label.text = str("LEVEL SCORE: ", score, "\nYOU BEAT THE GAME!!!")
	button.grab_focus()

func nextLevelButton():
		button.texture_focused = NEXTLVL_FOCUSES
		button.texture_normal = NEXTLVL_NORMAL
		button.texture_pressed = NEXTLVL_PRESSED
		next_level = "res://Levels/level%s.tscn"%[level+1]

func quitButton():
		button.texture_focused = QUIT_FOCUSES
		button.texture_normal = QUIT_NORMAL
		button.texture_pressed = QUIT_PRESSED
		next_level = MENU_PATH

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if next_level == MENU_PATH:
		var rand_name = names.pick_random()
		print(rand_name)
		ScoreSystem.resetScore(rand_name)
	get_tree().change_scene_to_file(next_level)
