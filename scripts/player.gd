extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -400.0

var face_idx = 0

var can_doublejump = false

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and (is_on_floor() or can_doublejump == true):
		can_doublejump = false
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if face_idx != 1:
		can_doublejump = false
	elif is_on_floor() and face_idx == 1:
		can_doublejump = true
		

	move_and_slide()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("switch"):
		if ScoreManager.claimed_fires == 0:
			return
			
		face_idx = (face_idx + 1) % (ScoreManager.claimed_fires + 1)
		
		if face_idx == 0:
			$Sprite2D.texture = load("res://assets/images/faces/easy.png")
		elif face_idx == 1:
			$Sprite2D.texture = load("res://assets/images/faces/peaceful_demon.png")
		elif face_idx == 2:
			$Sprite2D.texture = load("res://assets/images/faces/insane_demon.png")
