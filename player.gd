extends RigidBody3D

## How much force to apply when moving on the floor.
@export_range(750.0, 3000.0) var force_magnitude : float = 2750.0

## How much force to apply when jumping.
@export var thrust: float = 2500.0
@export var has_reached_the_goal: bool = false

@onready var level_completion_particles: GPUParticles3D = $LevelCompletionParticles
@onready var death_particles: GPUParticles3D = $DeathParticles

const LEVEL_DATA_PATH = "res://level_data.json"
var bounce: float
const BOUNCE_LOWER_BOUNDARY: float = 300.0
const BOUNCE_UPPER_BOUNDARY: float = 900.0


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
	if "Bounce" in body.get_groups():
		bounce = randf_range(BOUNCE_LOWER_BOUNDARY, BOUNCE_UPPER_BOUNDARY)
		apply_central_force(Vector3.UP * bounce)
		if abs(global_position.x) > 19 or abs(global_position.z) > 14:
			get_tree().reload_current_scene()
	
	if "Death" in body.get_groups():
		set_process(false)
		var tween = create_tween()
		tween.tween_interval(1.0)
		tween.tween_callback(func() -> void:get_tree().reload_current_scene())
		death_particles.emitting = true
	
	if "Goal" in body.get_groups():
		has_reached_the_goal = true
		complete_level(body.file_path)
		save_completed_level(body.level_number)
		level_completion_particles.emitting = true


func complete_level(next_level_file: String) -> void:
	set_process(false)
	var tween = create_tween()
	tween.tween_interval(1.0)
	tween.tween_callback(get_tree().change_scene_to_file.bind(next_level_file))


func save_completed_level(level: int) -> void:
	var completed_levels = []
	
	# Read completed levels
	if FileAccess.file_exists(LEVEL_DATA_PATH):
		var data_file = FileAccess.open(LEVEL_DATA_PATH, FileAccess.READ)
		var parsed_result = JSON.parse_string(data_file.get_as_text())
		if parsed_result is Dictionary:
			completed_levels = parsed_result["completedLevels"]
	
	# Write completed levels
	completed_levels.append(level)
	var dict_for_unique_val = {}
	for item in completed_levels:
		dict_for_unique_val[item] = true
	completed_levels = dict_for_unique_val.keys()
	completed_levels.sort()

	var file = FileAccess.open(LEVEL_DATA_PATH, FileAccess.WRITE)
	var data : Dictionary = {
		"completedLevels" : completed_levels,
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
	file.close()
