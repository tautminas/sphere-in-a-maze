extends Node3D

@onready var zooming_out_camera_3d: Camera3D = $ZoomingOutCamera3D
@onready var player: RigidBody3D = $Player

var y_coordinate_of_zooming_out_camera = 5.0
const ZOOMING_OUT_RATE = 1.05

func _physics_process(delta):
	if y_coordinate_of_zooming_out_camera > 150.0:
		get_tree().reload_current_scene()
	y_coordinate_of_zooming_out_camera += delta * ZOOMING_OUT_RATE
	var target_position = player.global_transform.origin
	var camera_position = Vector3(target_position.x, y_coordinate_of_zooming_out_camera, target_position.z)
	zooming_out_camera_3d.global_transform.origin = camera_position
