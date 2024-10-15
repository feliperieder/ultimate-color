extends Node

var campaign_mode = true
var late_levels = [4, 5, 6, 7, 8, 9, 10]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func  resetLevels():
	late_levels = [4, 5, 6, 7]

func selectLateLvl():
	var n = randf_range(0, late_levels.size() - 1)
	var next_lvl = late_levels[n]
	late_levels.remove_at(n)
	print(late_levels)
	print(next_lvl)
	return next_lvl
	
	
