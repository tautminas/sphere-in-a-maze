extends RigidBody3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("jump"):
		apply_central_force(Vector3.UP * delta * 1000.0)
	
	if Input.is_action_pressed("left"):
		apply_central_force(Vector3.LEFT * delta * 1000.0)
	
	if Input.is_action_pressed("right"):
		apply_central_force(Vector3.RIGHT * delta * 1000.0)

	if Input.is_action_pressed("up"):
		apply_central_force(Vector3.FORWARD * delta * 1000.0)
		
	if Input.is_action_pressed("down"):
		apply_central_force(Vector3.BACK * delta * 1000.0)


func _on_body_entered(body: Node) -> void:
	if "Goal" in body.get_groups():
		print("You win!")
		print(body.name)
