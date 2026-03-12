extends RigidBody2D

@export var speed : float = 450 
@export var lifetime : float = 3.0 
var detected_bodies = []
var direction : Vector2 = Vector2(600,-600)

func _ready(): 
	apply_impulse(direction)

func _on_rock_area_level_3_area_entered(area: Area2D) -> void:
	if area not in detected_bodies:
		detected_bodies.append(area)
		print("Entered:", area.name)



func _on_rock_area_level_3_area_exited(area: Area2D) -> void:
	if area in detected_bodies:
		detected_bodies.erase(area)
		print("Exited:", area.name)
