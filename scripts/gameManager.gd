extends Node2D

@export var gameTime : float = 0
var modulesGenerated : int = 0

@onready var storm := $killWall
@onready var gui := $HUD/Label
@onready var player := $player
@onready var resetButton := $HUD/Button

# old speed 130
# max speed = player speed (150)


# Called when the node enters the scene tree for the first time.
func _ready():
	resetButton.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	gameTime += delta # / ( 1 + (gameTime/60))
	player.speed = clampf(player.speed + delta*2, 200, 500) 
	storm.Speed = clampf(130+(gameTime/0.55), 130, player.speed)
	gui.text = "Score: " + str(round(gameTime)) + "\nWall/Player Speed: " + str(round(storm.Speed*10)/10) + "/" + str(round(player.speed*10)/10) + "\nModules Generated: " + str(modulesGenerated)
	#Engine.time_scale = 1 + (gameTime/60)


func _on_module_manager_module_generated():
	modulesGenerated += 1


func _on_area_2d_body_entered(body): #killwall collsions
	if(body == player): #player has been hit
		Engine.time_scale = 0.01
		resetButton.visible = true


func _on_button_pressed():
	get_tree().reload_current_scene()
	Engine.time_scale = 1
