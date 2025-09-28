extends DirectionalLight3D

@onready var player = $"../Player"

var y_offset = 6.6

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = Vector3(player.position.x, y_offset, player.position.z)
