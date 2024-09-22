extends Node2D

@onready var timer = $Timer as Timer
@onready var timer_label = $CanvasLayer/Label as Label

@export var timer_time = 90

#Variáveis de tempo
var minut
var sec
var player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = timer_time
	timer.start()
	player = get_tree().get_first_node_in_group("brush")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	minut = int(timer.time_left/60)
	sec = int((timer.time_left/60 - int(timer.time_left/60))*60)
	if sec <= 9:
		sec = str("0",sec)
	timer_label.text = str(minut,":",sec)


func _on_timer_timeout() -> void:
	player.endLevel()
	timer.stop()
