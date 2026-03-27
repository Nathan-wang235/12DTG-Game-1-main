extends Area2D

#？？？？为什么没有一点用 大话说早了其实是

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Levels/level_2.tscn")
		
