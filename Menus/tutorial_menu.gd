extends Node2D

const MENU_PATH = "res://Menus/Menu.tscn"
@onready var back_button = $CanvasLayer/VBoxContainer/Button as TextureButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	back_button.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(MENU_PATH)
