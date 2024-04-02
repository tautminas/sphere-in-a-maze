extends Control

@onready var back_button: Button = $BackButton

@export_file("*.tscn") var back_path

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	back_button.button_down.connect(on_back_pressed)

func on_back_pressed() -> void:
	get_tree().change_scene_to_file(back_path)
