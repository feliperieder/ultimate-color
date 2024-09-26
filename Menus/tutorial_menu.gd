extends Node2D

const MENU_PATH = "res://Menus/Menu.tscn"
@onready var back_button = $CanvasLayer/HBoxContainer/QuitButton as TextureButton
@onready var next_button = $CanvasLayer/HBoxContainer/NextButton as TextureButton
@onready var slide = $CanvasLayer/Slide as AnimatedSprite2D
const LAST_SLIDE = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	next_button.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_quit_button_pressed() -> void:
	get_tree().change_scene_to_file(MENU_PATH)


func _on_next_button_pressed() -> void:
	slide.frame += 1
	if slide.frame >= LAST_SLIDE:
		back_button.grab_focus()
		next_button.hide()
