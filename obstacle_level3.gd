extends Area2D


@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D
#will be speed in px per second
@export var speed = 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	path_follow.progress += speed * delta
	
