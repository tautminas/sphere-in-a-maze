extends Node3D

@onready var level_label_control: Control = $LevelLabelControl
@onready var player: RigidBody3D = $Player

var countdown = 15


func _on_timer_timeout() -> void:
	if player.has_reached_the_goal:
		return
	countdown -= 1
	level_label_control.level_description = "Level 8: You have " + str(countdown) + " seconds left"
	if countdown == 0:
		get_tree().reload_current_scene()
