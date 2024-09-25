extends Node

const SAVE_PATH = "res://ScoreSave/save_data.txt"
var total_score = 0
var high_scores = []
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	loadScore()
	print(high_scores)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func saveScore():
	#abre o arquivo e salva nele o q está em data
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	for entry in high_scores:
		file.store_line(entry[0] + ":" + str(entry[1]))
	file.close()

func loadScore():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	#if ResourceLoader.exists(SAVE_PATH):
	high_scores.clear()  # Limpa a lista antes de carregar
	while not file.eof_reached():
		var line = file.get_line()
		var parts  = line.split(":") # Converte a linha para inteiro e adiciona à lista
		if parts.size() == 2:
			var initials = parts[0]
			var score = int(parts[1])
			high_scores.append([initials, score])
	file.close()
	#else:
		#high_scores = []

func resetScore(initials = "TOP10"):
	high_scores.append([initials, total_score])
	high_scores.sort_custom(_sort_scores)  # Ordena usando uma função personalizada
	if high_scores.size() > 10:
		high_scores.pop_back()
	saveScore()
	total_score = 0

func _sort_scores(a, b):
	return a[1] > b[1]  # Ordena por pontuação
