extends Node

var left_end = 0
var right_end = 25
var top_score = 0
var started = false
var camera_init_pos = Vector3(11.66, 2.5, 11)

var pi = 3.14159

func restart_scene():
	started = false
	TransitionScreen.transition()
	get_tree().reload_current_scene()
