extends Area2D

@export var wall_node : Node
@export var elevator : Node

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
		if elevator != null:
			elevator.start()
