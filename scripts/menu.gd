extends Control

@onready var trailsList = $MarginContainer/VSplitContainer/Panel2/VBoxContainer/ItemList
@onready var selectedText = $MarginContainer/VSplitContainer/Panel2/VBoxContainer/Label2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_item_list_item_clicked(index, at_position, mouse_button_index):
	
	selectedText.text = "Selected Trail: " + trailsList.get_item_text(index)
	GlobalManager.selectedTrail = trailsList.get_item_text(index)
	GlobalManager.selectedTrailIndex = index


func _on_item_list_item_selected(index):
	
	pass # Replace with function body.

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		pass
		#print(event.position)
		#var clickedItem = trailsList.get_item_at_position(event.position - trailsList.global_position)
		#selectedText.text = "Selected Trail: " + trailsList.get_item_text(clickedItem)
		#GlobalManager.selectedTrail = trailsList.get_item_text(clickedItem)


func _on_button_pressed(): #play button
	GlobalManager.startGame()
	pass # Replace with function body.
