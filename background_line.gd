extends Node2D

# Caminho para a cena do objeto que você deseja instanciar
const OBJECT_SCENE_PATH = preload("res://Points/Positive Points.tscn")
const SPACING = 1  # Espaçamento entre os objetos

# Chamado quando a cena é carregada
func _ready() -> void:
	fill_line_with_objects()

# Função para preencher a linha com objetos
func fill_line_with_objects() -> void:
	var points = $Line2D.points  # Pega os pontos da Line2D

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
			instance.position = position
			add_child(instance)  # Adiciona o objeto à cena
