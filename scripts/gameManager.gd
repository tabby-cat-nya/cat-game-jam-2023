extends Node2D

@export var gameTime : float = 0
var modulesGenerated : int = 0

@onready var storm := $killWall
@onready var hud := $HUD/Label
@onready var player := $player

# old speed 130
# max speed = player speed (150)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	gameTime += delta # / ( 1 + (gameTime/60))
	player.speed = clampf(player.speed + delta/1, 150, 500) 
	storm.Speed = clampf(130+(gameTime/0.95), 130, player.speed)
	hud.text = "Score: " + str(round(gameTime)) + "\nWall/Player Speed: " + str(round(storm.Speed*10)/10) + "/" + str(round(player.speed*10)/10) + "\nModules Generated: " + str(modulesGenerated)
	#Engine.time_scale = 1 + (gameTime/60)


func _on_module_manager_module_generated():
	modulesGenerated += 1
