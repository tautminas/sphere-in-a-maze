extends Control

@onready var start_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/StartButton
@onready var controls_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/ControlsButton
@onready var credits_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/CreditsButton
@onready var exit_button: Button = $MarginContainer/HBoxContainer/VBoxContainer/ExitButton

@export_file("*.tscn") var start_path
@export_file("*.tscn") var controls_path
@export_file("*.tscn") var credits_path

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_button.button_down.connect(on_start_pressed)
	controls_button.button_down.connect(on_controls_pressed)
	credits_button.button_down.connect(on_credits_pressed)
	exit_button.button_down.connect(on_exit_pressed)

func on_start_pressed() -> void:
	get_tree().change_scene_to_file(start_path)

func on_controls_pressed() -> void:
	get_tree().change_scene_to_file(controls_path)

func on_credits_pressed() -> void:
	get_tree().change_scene_to_file(credits_path)

func on_exit_pressed() -> void:
	get_tree().quit()
