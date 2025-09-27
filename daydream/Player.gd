extends RigidBody3D

@export var speed := 7.0
@export var gravity := 50.0

@onready var _spring_arm: SpringArm3D = $SpringArm3D
#@onready var _model: Spatial = $

func _physics_process(delta: float) -> void:
		var move_direction := Vector3.ZERO
		move_direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
		move_direction.z = Input.get_action_strength("back") - Input.get_action_strength("forward")
		
	
