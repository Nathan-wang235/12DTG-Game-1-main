extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player3" :
		body.respawn = self.global_position
