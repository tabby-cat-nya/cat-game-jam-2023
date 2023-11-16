extends Sprite2D

@export var Speed : float
var currentSpeed : float

# Called when the node enters the scene tree for the first time.
func _ready():
	currentSpeed = Speed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += currentSpeed * delta
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	currentSpeed = 2*Speed


func _on_visible_on_screen_notifier_2d_screen_entered():
	currentSpeed = Speed
