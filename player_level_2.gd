extends CharacterBody2D

var SPEED := 300
var JUMP_VELOCITY := -480
var wall_jump_force := 750
var respawn = Vector2(400, 280)
var wall_jump_used := false

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += get_gravity().y * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$Jumpsound.play()
	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("ui_left", "ui_right")
	print(direction)
	if direction !=0.0:
		$Sprite2D.flip_h = direction < 0
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	# Reset wall jump when touching ground
	if is_on_floor():
		wall_jump_used = false

	# Normal jump
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Wall jump
	if Input.is_action_just_pressed("ui_accept") and is_on_wall() and !is_on_floor() and !wall_jump_used:
		wall_jump_used = true
		var wall_dir = get_wall_normal().x
		velocity.x = wall_dir * wall_jump_force
		velocity.y = JUMP_VELOCITY

	move_and_slide()
		
	if position.y >= 701:
		_respawn()

func _respawn():
	global_position = respawn


func _on_pt_2_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
