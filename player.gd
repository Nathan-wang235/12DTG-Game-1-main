extends CharacterBody2D
var SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var speed_multiplier: float = 5
@onready var effect_timer = $Dash_effect_time
@onready var cooldown_timer = $Dash_cooldown_time
var respawn = Vector2(242, -28)
var is_active := false
var is_on_cooldown := false
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$Jumpsound.play()
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction !=0:
		$Sprite2D.flip_h = direction >0
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	if position.y >= 1000:
		_respawn()
func _respawn():
	global_position = respawn
func _input(event):
	if event.is_action_pressed("Dash"):
		print("Dash input is sucessful")
		activate_buff()
func activate_buff():
	if is_active or is_on_cooldown:
		print("Dash need to be cooldown!")
		return
	else:
		is_active = true
		$Dashsound.play()
		SPEED *= speed_multiplier
		print("Speed is increased sucessful")
		effect_timer.start()
func _on_dash_effect_time_timeout() -> void:
	print("Dash effect timer timeout")
	SPEED = 300.0
	is_active = false
	is_on_cooldown = true
	
	cooldown_timer.start()
func _on_dash_cooldown_time_timeout() -> void:
	is_on_cooldown = false
