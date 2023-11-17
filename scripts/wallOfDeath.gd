extends Node2D

@export var Speed : float
@export var currentSpeed : float
@onready var notifier := $VisibleOnScreenNotifier2D
@onready var camera := $"../Camera2D"

# Called when the node enters the scene tree for the first time.
func _ready():
	if(notifier.is_on_screen()):
		currentSpeed = Speed
	else:
		currentSpeed = 2*Speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += currentSpeed * delta
	position.y = camera.position.y
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	currentSpeed = 2*Speed


func _on_visible_on_screen_notifier_2d_screen_entered():
	currentSpeed = Speed
