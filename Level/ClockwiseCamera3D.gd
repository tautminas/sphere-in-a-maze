extends Camera3D

const ROTATION_SPEED = 0.05

func _process(delta: float) -> void:
	rotate_y(ROTATION_SPEED * delta)
