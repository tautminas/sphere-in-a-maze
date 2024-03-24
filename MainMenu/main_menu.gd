extends Control

@onready var start_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/StartButton
@onready var exit_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/ExitButton

@export_file("*.tscn") var file_path

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_button.button_down.connect(on_start_pressed)
	exit_button.button_down.connect(on_exit_pressed)

func on_start_pressed() -> void:
	get_tree().change_scene_to_file(file_path)

func on_exit_pressed() -> void:
	get_tree().quit()
