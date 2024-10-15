extends Node2D
var points

@onready var background = $Lines as Node2D
@onready var player = $PlayerTest as CharacterBody2D
@onready var drawing = $Drawing as Node2D
@onready var clock = $Timer as Node2D
@onready var animation = $UILayer/CanvasLayer/animation as AnimatedSprite2D

@export var level = 1
@export var time = 20

const SCORE_MENU_PATH = preload("res://Menus/ScoreMenu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func endLevel(points):
	background.hide()
	clock.hide()
	player.hide()
	animation.hide()
	if drawing.drawing:
		drawing.finishingLine()
	drawing.level_finished = true
	MenuScoreInstanciate(points)

func MenuScoreInstanciate(points):
	var score_menu = SCORE_MENU_PATH.instantiate()
	score_menu.score = points
	ScoreSystem.total_score += points
	score_menu.level = level
	add_child(score_menu)
