extends Area2D









func _on_body_entered(body: Node2D) -> void:
	if body.name == "player":
		if $"../../Player".Input.is_action_just_pressed("Info"):
			$"..".start()
			print("INFO")
