extends Camera3D

const ROTATION_SPEED = 0.05

func _process(delta: float) -> void:
	rotate_y(-1 * ROTATION_SPEED * delta)
