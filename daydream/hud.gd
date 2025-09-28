extends CanvasLayer

@onready var score = $Score
var score_value = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score.text = str(score_value)
	
func set_score(p_value):
	score_value = p_value
