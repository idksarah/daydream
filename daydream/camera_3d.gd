extends Camera3D

@onready var player = $"../Player"

var y_offset = 2.5
var z_reg_speed = .075
var z_move_speed = 2
var z_off_screen_thresh = 1.8

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position = Vector3(player.position.x, y_offset, player.position.z)
	print(position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_instance_valid(player) && Singleton.started:
		pass
		var z_goal = player.position.z
		#var z_goal = min(position.z - z_reg_speed, player.position.z)
		position.z = lerp(position.z, z_goal, 0.08 )
	else:
		position = Singleton.camera_init_pos
