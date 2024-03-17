extends RigidBody3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept"):
		apply_central_force(Vector3.UP * delta * 1000.0)
	
	if Input.is_action_pressed("ui_left"):
		apply_central_force(Vector3.LEFT * delta * 1000.0)
	
	if Input.is_action_pressed("ui_right"):
		apply_central_force(Vector3.RIGHT * delta * 1000.0)

	if Input.is_action_pressed("ui_up"):
		apply_central_force(Vector3.FORWARD * delta * 1000.0)
		
	if Input.is_action_pressed("ui_down"):
		apply_central_force(Vector3.BACK * delta * 1000.0)		
