extends Node3D

@onready var zoomed_in_camera_3d: Camera3D = $ZoomedInCamera3D
@onready var player: RigidBody3D = $Player

const Y_COORDINATE_OF_ZOOMED_IN_CAMERA = 5.0

func _physics_process(delta):
	var target_position = player.global_transform.origin
	var camera_position = Vector3(target_position.x, Y_COORDINATE_OF_ZOOMED_IN_CAMERA, target_position.z)
	zoomed_in_camera_3d.global_transform.origin = camera_position
