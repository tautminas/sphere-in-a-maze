extends Control

@onready var level_1: Button = $MarginContainer/HBoxContainer/VBoxContainer/Level1
@onready var level_2: Button = $MarginContainer/HBoxContainer/VBoxContainer2/Level2
@onready var level_3: Button = $MarginContainer/HBoxContainer/VBoxContainer/Level3
@onready var level_4: Button = $MarginContainer/HBoxContainer/VBoxContainer2/Level4
@onready var level_5: Button = $MarginContainer/HBoxContainer/VBoxContainer/Level5
@onready var level_6: Button = $MarginContainer/HBoxContainer/VBoxContainer2/Level6
@onready var level_7: Button = $MarginContainer/HBoxContainer/VBoxContainer/Level7
@onready var level_8: Button = $MarginContainer/HBoxContainer/VBoxContainer2/Level8
@onready var level_9: Button = $MarginContainer/HBoxContainer/VBoxContainer/Level9
@onready var level_10: Button = $MarginContainer/HBoxContainer/VBoxContainer2/Level10
@onready var menu_button: Button = $MenuButton
@onready var completed_levels_label: Label = $CompletedLevelsLabel

@export_file("*.tscn") var level_1_path
@export_file("*.tscn") var level_2_path
@export_file("*.tscn") var level_3_path
@export_file("*.tscn") var level_4_path
@export_file("*.tscn") var level_5_path
@export_file("*.tscn") var level_6_path
@export_file("*.tscn") var level_7_path
@export_file("*.tscn") var level_8_path
@export_file("*.tscn") var level_9_path
@export_file("*.tscn") var level_10_path
@export_file("*.tscn") var menu_path


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	level_1.button_down.connect(on_level_1_pressed)
	level_2.button_down.connect(on_level_2_pressed)
	level_3.button_down.connect(on_level_3_pressed)
	level_4.button_down.connect(on_level_4_pressed)
	level_5.button_down.connect(on_level_5_pressed)
	level_6.button_down.connect(on_level_6_pressed)
	level_7.button_down.connect(on_level_7_pressed)
	level_8.button_down.connect(on_level_8_pressed)
	level_9.button_down.connect(on_level_9_pressed)
	level_10.button_down.connect(on_level_10_pressed)
	menu_button.button_down.connect(on_menu_pressed)
	
	alter_completed_levels_label()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("escape"):
		on_menu_pressed()

func on_level_1_pressed() -> void:
	get_tree().change_scene_to_file(level_1_path)

func on_level_2_pressed() -> void:
	get_tree().change_scene_to_file(level_2_path)

func on_level_3_pressed() -> void:
	get_tree().change_scene_to_file(level_3_path)

func on_level_4_pressed() -> void:
	get_tree().change_scene_to_file(level_4_path)

func on_level_5_pressed() -> void:
	get_tree().change_scene_to_file(level_5_path)

func on_level_6_pressed() -> void:
	get_tree().change_scene_to_file(level_6_path)

func on_level_7_pressed() -> void:
	get_tree().change_scene_to_file(level_7_path)

func on_level_8_pressed() -> void:
	get_tree().change_scene_to_file(level_8_path)

func on_level_9_pressed() -> void:
	get_tree().change_scene_to_file(level_9_path)

func on_level_10_pressed() -> void:
	get_tree().change_scene_to_file(level_10_path)

func on_menu_pressed() -> void:
	get_tree().change_scene_to_file(menu_path)

func alter_completed_levels_label() -> void:
	const LEVEL_DATA_PATH = "res://level_data.json"
	var completed_levels = []
	# Read completed levels
	if FileAccess.file_exists(LEVEL_DATA_PATH):
		var data_file = FileAccess.open(LEVEL_DATA_PATH, FileAccess.READ)
		var parsed_result = JSON.parse_string(data_file.get_as_text())
		if parsed_result is Dictionary:
			completed_levels = parsed_result["completedLevels"]
	# Remove duplicated from completed levels
	var dict_for_unique_val = {}
	for item in completed_levels:
		dict_for_unique_val[item] = true
	completed_levels = dict_for_unique_val.keys()
	# Prepare string about completed levels
	var completed_levels_notification = "Completed levels: "
	for i in completed_levels:
		completed_levels_notification += str(i) + ", "
	completed_levels_notification = completed_levels_notification.substr(0, completed_levels_notification.length() - 2)
	if len(completed_levels) == 0:
		completed_levels_notification = "No completed levels so far"
	elif len(completed_levels) == 10:
		completed_levels_notification = "All levels are completed!"
	# Change the text of the label
	completed_levels_label.text = completed_levels_notification
