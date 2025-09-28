extends Node3D

var falling_timeout = .35

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_3d_body_entered(body: Node3D) -> void:
	print(body.name)
	if body is Player:
		await get_tree().create_timer(falling_timeout).timeout
		Singleton.restart_scene()
