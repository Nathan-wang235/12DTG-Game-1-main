extends Area2D



@onready var path_follow : PathFollow2D = $Path2D/PathFollow2D
@export var elv6_level3_speed = 0



func _process(delta: float) -> void:
	path_follow.progress += elv6_level3_speed * delta

func start():
	elv6_level3_speed = 100
