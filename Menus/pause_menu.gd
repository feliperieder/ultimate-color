extends Control

@onready var resume_button = $MarginContainer/VBoxContainer/Resume as TextureButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_resume_pressed() -> void:
	get_tree().current_scene.pauseMenu()


func _on_quit_pressed() -> void:
	get_tree().current_scene.pauseMenu()
	get_tree().change_scene_to_file("res://Menus/Menu.tscn")
