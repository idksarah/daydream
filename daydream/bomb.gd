class_name Bomb
extends RigidBody3D

@onready var debris = $Debris
@onready var timer = $Timer
@onready var model = $Model
var explosion_timeout = 1
var animation_timeout = .2
var exploding = false
var playerInRadius = false

#var red_baby = load("res://Assets/Red-baby-duck/red_baby_duck.obj")
var yellow_baby_path = "res://Assets/Yellow-baby-duck/yellow_baby_duck.obj"
var red_baby_path = "res://Assets/Red-baby-duck/red_baby_duck.obj" 
var is_yellow = true
#var yellow_baby = load("res://Assets/Yellow-baby-duck/yellow_baby_duck.obj")

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
	if is_yellow:
		is_yellow = false
		model.mesh = load(red_baby_path)
	else:
		is_yellow = true
		model.mesh = load(yellow_baby_path)
	
func _on_area_3d_body_entered(body: Node3D) -> void:
	if (!(body is Fence || body is Car || body is Player)): return
	#print("bomb entered; body name = " + str(body))
	playerInRadius = true
	await get_tree().create_timer(timer.time_left + animation_timeout).timeout
	if is_instance_valid(body) && body is Player && playerInRadius:
		Singleton.restart_scene()
	if is_instance_valid(body) && !(body is Player):
		body.queue_free()


func _on_area_3d_body_exited(body: Node3D) -> void:
	if is_instance_valid(body) && body is Player:
		playerInRadius = false
