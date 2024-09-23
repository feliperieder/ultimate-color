extends Node2D
var points

@onready var background = $Line2D as Line2D
@onready var clock = $Timer as Node2D
@onready var player = $PlayerTest as CharacterBody2D
@onready var drawing = $Drawing as Node2D

const SCORE_MENU_PATH = preload("res://Menus/Score Menu.tscn")

# Caminho para a cena do objeto que você deseja instanciar
const OBJECT_SCENE_PATH = preload("res://Points/Positive Points.tscn")
const SPACING = 1  # Espaçamento entre os objetos

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
		fill_line_with_objects()
		var bullets = get_tree().get_node_count_in_group("positive_point")
		player.current_bullets = bullets
		player.bullet_point = player.MAX_POINTS / bullets

# Função para preencher a linha com objetos
func fill_line_with_objects() -> void:
	var points = background.points  # Pega os pontos da Line2D

	for i in range(points.size() - 1):
		var start_point = points[i]
		var end_point = points[i + 1]
		var distance = start_point.distance_to(end_point)

		# Calcular quantos objetos instanciar entre os pontos
		var num_objects = int(distance / SPACING)

		for j in range(num_objects):
			# Calcular a posição usando linear_interpolate
			var position = start_point.lerp(end_point, j / float(num_objects))
			var instance = OBJECT_SCENE_PATH.instantiate()
			instance.color = "red"
			instance.position = position
			add_child(instance)  # Adiciona o objeto à cena


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func endLevel(points):
	background.hide()
	clock.hide()
	player.hide()
	drawing.finishingLine()
	drawing.level_finished = true
	MenuScoreInstanciate(points)
	

func MenuScoreInstanciate(points):
	var score_menu = SCORE_MENU_PATH.instantiate()
	score_menu.score = points
	add_child(score_menu)
	
