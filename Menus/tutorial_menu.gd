extends Node2D

const MENU_PATH = "res://Menus/Menu.tscn"
@onready var menu_button = $CanvasLayer/HBoxContainer/QuitButton as TextureButton
@onready var next_button = $CanvasLayer/HBoxContainer/NextButton as TextureButton
@onready var back_button = $CanvasLayer/HBoxContainer/BackButton
@onready var slide = $CanvasLayer/Slide as AnimatedSprite2D
const LAST_SLIDE = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	next_button.grab_focus()
	back_button.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_quit_button_pressed() -> void:
	get_tree().change_scene_to_file(MENU_PATH)


func _on_next_button_pressed() -> void:
	slide.frame += 1
	if slide.frame == 1:
		back_button.show()
	if slide.frame >= LAST_SLIDE:
		menu_button.grab_focus()
		next_button.hide()


func _on_back_button_pressed() -> void:
	slide.frame -= 1
	if slide.frame == LAST_SLIDE - 1:
		next_button.show()
	if slide.frame <= 0:
		next_button.grab_focus()
		back_button.hide()
