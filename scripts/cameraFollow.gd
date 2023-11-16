extends Camera2D

@export var target : Node2D
@onready var camera := self

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	camera.transform.x = target.transform.x
	camera.transform.y = target.transform.y
	pass
