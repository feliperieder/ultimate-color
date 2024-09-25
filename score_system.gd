extends Node

const SAVE_PATH = "res://ScoreSave/save_data.save"
var total_score = 0
var top10 = [0,0,0,0,0,0,0,0,0,0]
var top10_nick = ['a']

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#loadScore()
	print(top10)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func saveScore():
	#abre o arquivo e salva nele o q está em data
	var get_file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	top10 = get_file.get_line(top10)
	top10_nick = get_file.get(top10_nick)
	get_file.close()


func loadScore():
	if FileAccess.file_exists(SAVE_PATH):
		var get_load = FileAccess.open(SAVE_PATH, FileAccess.READ)
		FileAccess.open(SAVE_PATH, FileAccess.READ)
		top10 = get_load.get(top10)
		top10_nick = get_load.get(top10_nick)
		get_load.close()

func resetScore():
	#ScoreSystem.top10.append(ScoreSystem.total_score)
	#ScoreSystem.saveScore()
	#total_score = 0
