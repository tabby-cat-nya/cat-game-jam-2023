extends StaticBody2D

var hasMouse : bool = false
var isDragging : bool = false
@onready var path := $"../.."
var curve : Curve2D
@onready var line := $"../../Line2D"

# Called when the node enters the scene tree for the first time.
func _ready():
	curve = path.get_curve()
	
	
	
	line.default_color = Color(1,1,1,1)  
	line.width = 20  
	for point in curve.get_baked_points():  
		line.add_point(point) 
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_pressed("Interact") and hasMouse):
		isDragging = true
	else:
		isDragging = false
	
	if(isDragging):
		global_position = curve.get_closest_point(get_global_mouse_position()) #more working than the below
		#global_position = curve.get_closest_point(get_global_mouse_position()+ Vector2(217, -145)) 
		

func _on_area_2d_mouse_entered():
	hasMouse = true


func _on_area_2d_mouse_exited():
	hasMouse = false


