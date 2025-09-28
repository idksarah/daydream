extends CharacterBody3D

const SPEED = 25.0
const BOMB_OFFSET = .5

var Bomb = preload("res://bomb.tscn")
@onready var hud = $"../HUD"

var Direction := {
	forward = "forward",
	left = "left",
	back = "back",
	right = "right"
}

var direction = Direction.forward
var cachedDirection = Direction.forward

var score = 0

func _physics_process(delta: float) -> void:
	score =  (int(abs(position.z - 5) * 10))
	hud.set_score(score)
	
	# gravity
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# keymap peepee
	if Input.is_action_just_released("ui_left"):
		velocity.x -= SPEED
		direction = Direction.left
	elif Input.is_action_just_released("ui_right"):
		velocity.x += SPEED
		direction = Direction.right
	else:
		velocity.x = 0
		
	if Input.is_action_just_pressed("ui_up"):
		velocity.z -= SPEED
		direction = Direction.forward
	elif Input.is_action_just_pressed("ui_down"):
		velocity.z += SPEED
		direction = Direction.back
	else:
		velocity.z = 0
		
	#print(direction)

	move_and_slide()
	
	# set direction
	if cachedDirection != direction:
		if direction == Direction.forward:
			global_rotation = Vector3(0, 0, 0)
		elif direction == Direction.right:
			global_rotation = Vector3(0, -Singleton.pi / 2, 0)
		elif direction == Direction.left:
			global_rotation = Vector3(0, Singleton.pi / 2, 0)
		else:
			global_rotation = Vector3(0, Singleton.pi, 0)
		cachedDirection = direction
	
	# bomb mechanics
	if Input.is_action_just_pressed("ui_throw"):
		var bomb_instance = Bomb.instantiate()
		var bomb_offset_x
		var bomb_offset_y
		if direction == Direction.left || direction == Direction.right:
			bomb_offset_y = 0
			if direction == Direction.left:
				bomb_offset_x = -BOMB_OFFSET
			else:
				bomb_offset_x = BOMB_OFFSET
		else:
			bomb_offset_x = 0
			if direction == Direction.forward:
				bomb_offset_y = -BOMB_OFFSET
			else:
				bomb_offset_y = BOMB_OFFSET
		
		var bomb_position = Vector3(position.x + bomb_offset_x, position.y, position.z + bomb_offset_y)
		bomb_instance.transform.origin = bomb_position 
		get_tree().get_root().add_child(bomb_instance)
		
func _on_area_3d_body_entered(body: Node3D) -> void:
	#print(body.exploding)
	if (body is Car):
		Singleton.restart_scene()

func _on_visible_on_screen_notifier_3d_screen_exited() -> void:
	Singleton.restart_scene()
