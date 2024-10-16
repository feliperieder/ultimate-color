extends Node

var campaign_mode = true
var mid_levels = [4, 5, 6, 7, 8]
var late_levels = [9, 10, 11, 12, 13, 14 ,15, 16]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func  resetLevels():
	mid_levels = [4, 5, 6, 7, 8]
	late_levels = [9, 10, 11, 12, 13, 14 ,15, 16]

func selectLateLvl():
	if not mid_levels.is_empty():
		var n = randf_range(0, mid_levels.size() - 1)
		var next_lvl = mid_levels[n]
		mid_levels.remove_at(n)
		return next_lvl
	else:
		var n = randf_range(0, late_levels.size() - 1)
		var next_lvl = late_levels[n]
		late_levels.remove_at(n)
		return next_lvl
	
	
