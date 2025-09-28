class_name Car
extends RigidBody3D

@onready var CarModel = $CarModel

var red_car_path = "res://Assets/Red-car/RedCar.obj"
var blue_car_path = "res://Assets/Blue-car/BlueCar.obj"
var yellow_car_path = "res://Assets/Yellow-car/YellowCar.obj"

var goingLeft = true
var speed = .075

var rand = randi() % 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	goingLeft = bool(randi() % 2)
	if !goingLeft:
		rotate_y(Singleton.pi)
	if rand == 0:
		CarModel.mesh = load(red_car_path)
	if rand == 1:
		CarModel.mesh = load(blue_car_path)
	if rand == 2:
		CarModel.mesh = load(yellow_car_path)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if goingLeft:
		position.x -= speed
	else:
		position.x += speed
	if position.x <= Singleton.left_end:
		position.x += Singleton.right_end - Singleton.left_end
	elif position.x >= Singleton.right_end:
		position.x -= Singleton.right_end - Singleton.left_end
