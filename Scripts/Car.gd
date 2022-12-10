extends Node2D

export(String, 'red', 'blue', 'yellow', 'purple') var color = 'red'
var speed: int = 200
var playing: bool = false

func _ready():
	$CarSprite/AnimatedSprite.animation = color

func _process(delta):
	if not playing: return

func _on_LevelGUI_start():
	playing = true
