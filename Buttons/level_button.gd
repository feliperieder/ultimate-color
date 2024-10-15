extends TextureButton

@onready var label = $Label as Label

@export var level = 1

const FOCUSED_BUTTON = preload("res://Art/fonts/ButtonHovered.tres")
const NORMAL_BUTTON = preload("res://Art/fonts/NormalButton.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = str(level)
	if level == 1:
		self.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	var level_path = "res://Levels/level%s.tscn"%[level]
	Global.campaign_mode = false
	Music.playLevelMusic()
	get_tree().change_scene_to_file(level_path)


func _on_focus_entered() -> void:
	label.label_settings = FOCUSED_BUTTON


func _on_focus_exited() -> void:
	label.label_settings = NORMAL_BUTTON
