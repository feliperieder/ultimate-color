extends Node2D

@onready var animation = $AnimationPlayer as AnimationPlayer
@onready var timer = $Timer as Timer

@export var disturb_time = 0
@export var duration = 0

var played = false
var level_timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	played = false
	level_timer = get_tree().get_first_node_in_group("timer")
	timer.wait_time = duration

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if disturb_time > 0:
		if level_timer.timer.time_left <= disturb_time and not played:
			played = true
			animation.play("show")
			timer.start()

func _on_timer_timeout() -> void:
	timer.stop()
	animation.play("hide")
