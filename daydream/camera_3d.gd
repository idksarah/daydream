extends Camera3D

@onready var player = $"../Player"

var y_offset = 2.5
var z_offset = 2
var z_reg_speed = .075
var z_move_speed = 2
var z_off_screen_thresh = 1.8

var cached_z

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector3(player.position.x, y_offset, player.position.z + z_offset)
	cached_z = player.position.z + z_offset

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var z_goal = min(position.z - z_reg_speed, player.position.z)
	position.z = lerp(position.z, z_goal, 0.08 )
