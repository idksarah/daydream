class_name Car
extends RigidBody3D

var goingLeft = true
var speed = .075

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	goingLeft = bool(randi() % 2)
	if !goingLeft:
		rotate_y(Singleton.pi)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	if goingLeft:
		position.x -= speed
	else:
		position.x += speed
	if position.x <= Singleton.left_end:
		position.x += Singleton.right_end - Singleton.left_end
		#print("going to right side")
	elif position.x >= Singleton.right_end:
		position.x -= Singleton.right_end - Singleton.left_end
		#print("going to left side")
