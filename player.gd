extends Node3D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		position.x -= delta * 100
	
	if Input.is_action_pressed("ui_right"):
		position.x += delta * 100
