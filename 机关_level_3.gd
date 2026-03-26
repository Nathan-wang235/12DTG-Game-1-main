extends Area2D

@export var wall_node : Node
@export var elevator_1 : Node
@export var elevator_2 : Node
@export var elevator_3 : Node
@export var elevator_4 : Node
@export var elevator_5 : Node
@export var elevator_6 : Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_area_entered(area: Area2D) -> void:
	if area.name == "Rock_area_level3" :
		print("test successful")
		if wall_node != null:
			wall_node.queue_free()
		if elevator_1 != null:
			elevator_1.start()
		if elevator_2 != null:
			elevator_2.start()
		if elevator_3 != null:
			elevator_3.start()
		if elevator_4 != null:
			elevator_4.start()
		if elevator_5 != null:
			elevator_5.start()
		if elevator_6 != null:
			elevator_6.start()
			
