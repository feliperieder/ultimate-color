extends Line2D


const POSITIVE_POINTS_PATH = preload("res://Points/Positive Points.tscn")
const DRAW_ZONE_PATH = preload("res://Points/DrawZone.tscn")
const SPACING = 1  # Espaçamento entre os objetos

@export_enum("red", "yellow", "blue", "white", "purple", "pink", "light_yellow", "green") var color = "red"
const COLOR_RED = Color.INDIAN_RED
const COLOR_YELLOW = Color.KHAKI
const COLOR_BLUE = Color.SKY_BLUE
const COLOR_WHITE = Color(0.729, 0.792, 0.914)
const COLOR_PURPLE = Color.MEDIUM_PURPLE
const COLOR_PINK = Color.MISTY_ROSE
const COLOR_GREEN = Color.LIGHT_GREEN
const COLOR_LIGHT_YELLOW = Color.LIGHT_GOLDENROD

var initial_colors = ["red", "blue", "yellow", "white"]
var colors = ["red", "yellow", "blue", "white", "purple", "pink", "green"]

@export var time_to_appear = 20

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_tree().current_scene.level <= 2:
		var random_color = randi_range(0, initial_colors.size()-1)
		color = initial_colors[random_color]
	else:
		var random_color = randi_range(0, colors.size()-1)
		color = colors[random_color]
	setColor()
	fill_line_with_objects()
	var bullets = get_tree().get_node_count_in_group("positive_point")
	var player = get_tree().get_first_node_in_group("brush")
	player.current_bullets = bullets
	player.bullet_point = player.MAX_POINTS / bullets
	

# Função para preencher a linha com objetos
func fill_line_with_objects() -> void:
	for i in range(points.size() - 1):
		var start_point = points[i]
		var end_point = points[i + 1]
		var distance = start_point.distance_to(end_point)

		# Calcular quantos objetos instanciar entre os pontos
		var num_objects = int(distance / SPACING)

		for j in range(num_objects):
			# Calcular a posição usando linear_interpolate
			var position = start_point.lerp(end_point, j / float(num_objects))
			instanciatePoints(position)
			instanciateDrawZone(position)

func instanciatePoints(position):
			var instance = POSITIVE_POINTS_PATH.instantiate()
			instance.color = color
			instance.position = position
			add_child(instance)  # Adiciona o objeto à cena
			
func instanciateDrawZone(position):
		var instance = DRAW_ZONE_PATH.instantiate()
		instance.position = position
		add_child(instance)  # Adiciona o objeto à cena
	

func setColor():
	match color:
		"red": default_color = COLOR_RED
		"yellow": default_color = COLOR_YELLOW
		"blue": default_color = COLOR_BLUE
		"white": default_color = COLOR_WHITE
		"purple": default_color = COLOR_PURPLE
		"pink": default_color = COLOR_PINK
		"light_yellow": default_color = COLOR_LIGHT_YELLOW
		"green": default_color = COLOR_GREEN
		
