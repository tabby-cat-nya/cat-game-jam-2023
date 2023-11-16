extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
@onready var camera := $Camera3D # speedy getNode()
@onready var controller := self
# @export var camera : Camera3D
var xRot = 0
@export var sensitivity = 0.1

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("moveLeft", "moveRight", "moveForward", "moveBackward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	#handle camera
	var mouseMov = Input.get_last_mouse_velocity()
	##camera.rotation.y -= mouseMov.x/100 * delta
	#camera.rotate_y(mouseMov.x/100 * delta)
	#camera.rotate_x(mouseMov.y/100 * delta)
	
	var mouseX = mouseMov.x * sensitivity
	var mouseY = mouseMov.y * sensitivity
	var rot = camera.rotation_degrees
	var desiredX = rot.y - mouseX
	xRot -= mouseY
	xRot = clampf(xRot, -90.0, 90.0)
	camera.rotation_degrees = Vector3(xRot, desiredX, 0)
	controller.rotation_degrees = Vector3(0, desiredX, 0)

	move_and_slide()
