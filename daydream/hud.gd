extends CanvasLayer

@onready var score = $Score
@onready var top_score = $TopScore
@onready var player = $"../Player"
var score_value = 0
var top_score_value = Singleton.top_score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score.text = str(score_value)
	
	top_score_value = max(score_value, top_score_value)
	Singleton.top_score = top_score_value
	top_score.text = "top score: " + str(Singleton.top_score)
	
func set_score(p_value):
	score_value = p_value
