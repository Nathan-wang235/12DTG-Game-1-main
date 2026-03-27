extends Control

signal dia_fin
@export_file("*.json") var d_file

var dia = []
var current_dia_id = 0
var dia_active = false

func _ready() -> void:
	$NinePatchRect.visible = false
	
func start():
	if dia_active:
		return
	dia_active = true
	$NinePatchRect.visible = true
	dia = load_dia()
	current_dia_id = -1
	next_script()
	
func load_dia():
	var file = FileAccess.open("res://Text/Text1.json", FileAccess.READ)
	var content = JSON.parse_string(file.get_as_text())
	return content
	
func _input(event):
	if !dia_active:
		return
	if event.is_action_pressed("Info"):
		next_script()

func next_script():
	current_dia_id += 1
	if current_dia_id >= len(dia):
		dia_active = false
		$NinePatchRect.visible = false
		emit_signal("dia_fin")
		return
	
	$NinePatchRect/Text.text = dia[current_dia_id]["text"]
	
