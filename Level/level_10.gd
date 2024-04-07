extends Node3D

@onready var player: RigidBody3D = $Player
@onready var zoomed_in_clockwise_camera_3d: Camera3D = $ZoomedInClockwiseCamera3D

var force_magnitude : float = 2750.0 * 2
const Y_COORDINATE_OF_ZOOMED_IN_CAMERA = 10.0
const ROTATION_SPEED = 0.05

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	zoomed_in_clockwise_camera_3d.rotate_y(ROTATION_SPEED * delta)
	
	if Input.is_action_pressed("right"):
		player.apply_central_force(Vector3.LEFT * delta * force_magnitude)
	
	if Input.is_action_pressed("left"):
		player.apply_central_force(Vector3.RIGHT * delta * force_magnitude)

	if Input.is_action_pressed("down"):
		player.apply_central_force(Vector3.FORWARD * delta * force_magnitude)
		
	if Input.is_action_pressed("up"):
		player.apply_central_force(Vector3.BACK * delta * force_magnitude)


func _physics_process(delta):
	var target_position = player.global_transform.origin
	var camera_position = Vector3(target_position.x, Y_COORDINATE_OF_ZOOMED_IN_CAMERA, target_position.z)
	zoomed_in_clockwise_camera_3d.global_transform.origin = camera_position
