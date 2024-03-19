extends RigidBody3D

## How much force to apply when moving on the floor.
@export_range(750.0, 3000.0) var force_magnitude : float = 2750.0

## How much force to apply when jumping.
@export var thrust: float = 2500.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("jump"):
		apply_central_force(Vector3.UP * delta * thrust)
	
	if Input.is_action_pressed("left"):
		apply_central_force(Vector3.LEFT * delta * force_magnitude)
	
	if Input.is_action_pressed("right"):
		apply_central_force(Vector3.RIGHT * delta * force_magnitude)

	if Input.is_action_pressed("up"):
		apply_central_force(Vector3.FORWARD * delta * force_magnitude)
		
	if Input.is_action_pressed("down"):
		apply_central_force(Vector3.BACK * delta * force_magnitude)


func _on_body_entered(body: Node) -> void:
	if "Goal" in body.get_groups():
		complete_level(body.file_path)
		

func complete_level(next_level_file: String) -> void:
	set_process(false)
	var tween = create_tween()
	tween.tween_interval(1.0)
	tween.tween_callback(get_tree().change_scene_to_file.bind(next_level_file))
