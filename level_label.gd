extends Control

@export var level_description: String
@onready var level_label: Label = $LevelLabel

func _process(delta: float) -> void:
	level_label.text = level_description
