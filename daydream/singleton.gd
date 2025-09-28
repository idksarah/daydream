extends Node

var left_end = 0
var right_end = 25
var top_score = 0
var started = false

var pi = 3.14159

func restart_scene():
	started = false
	get_tree().reload_current_scene()
