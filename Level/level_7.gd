extends Node3D

@onready var player: RigidBody3D = $Player

var force_magnitude : float = 2750.0 * 0.9

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Input.is_action_pressed("right"):
		player.apply_central_force(Vector3.LEFT * delta * force_magnitude)
	
	if Input.is_action_pressed("left"):
		player.apply_central_force(Vector3.RIGHT * delta * force_magnitude)

	if Input.is_action_pressed("down"):
		player.apply_central_force(Vector3.FORWARD * delta * force_magnitude)
		
	if Input.is_action_pressed("up"):
		player.apply_central_force(Vector3.BACK * delta * force_magnitude)
