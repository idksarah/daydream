class_name Bomb
extends RigidBody3D

@onready var debris = $Debris
var body
@onready var timer = $Timer
var explosion_timeout = 1.5
var animation_timeout = .2
var exploding = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	timer.wait_time = explosion_timeout
	timer.start()
		
func _process(delta: float) -> void:
	if timer.time_left == 0:
		debris.emitting = true
		exploding = true
		await get_tree().create_timer(animation_timeout).timeout
		queue_free()
	
func _on_area_3d_body_entered(body: Node3D) -> void:
	if (!(body is Fence || body is Car)): return
	print("bomb entered; body name = " + str(body))
	await get_tree().create_timer(timer.time_left + animation_timeout).timeout
	if is_instance_valid(body):
		body.queue_free()
