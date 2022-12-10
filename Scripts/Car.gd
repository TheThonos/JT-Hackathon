extends Node2D

signal done

export(String, 'red', 'blue', 'yellow', 'purple') var color = 'red'
var speed: int = 2
var playing: bool = false
var road: TileMap
var car: int = 1

func _ready():
	$CarSprite/AnimatedSprite.animation = color
	road = get_node('../Road')
	$CarPath.curve.clear_points()
	$CarPath.curve.add_point(position)

func _process(delta):
	if Input.is_action_just_pressed('play'):
		playing = true
	if playing: travel_path(delta)
	else: set_path(delta)

func _on_LevelGUI_start():
	playing = true

func set_path(delta):
	if not 'Car' + str(car) == name: return
	if Input.is_action_just_pressed('up') and road.get_cellv(road.world_to_map(position) + Vector2(-3, -1)) == 0:
		position.y -= 32
		rotation_degrees = 0
		$CarPath.curve.add_point(position)
	if Input.is_action_just_pressed('left') and road.get_cellv(road.world_to_map(position) + Vector2(-4, 0)) == 0:
		position.x -= 32
		rotation_degrees = 270
		$CarPath.curve.add_point(position)
	if Input.is_action_just_pressed('down') and road.get_cellv(road.world_to_map(position) + Vector2(-3, 1)) == 0:
		position.y += 32
		rotation_degrees = 180
		$CarPath.curve.add_point(position)
	if Input.is_action_just_pressed('right') and road.get_cellv(road.world_to_map(position) + Vector2(-2, 0)) == 0:
		position.x += 32
		rotation_degrees = 90
		$CarPath.curve.add_point(position)

func travel_path(delta):
	$CarPath/PathFollow2D.offset += speed
	position = $CarPath/PathFollow2D.position
	rotation = $CarPath/PathFollow2D.rotation + PI / 2
	if $CarPath/PathFollow2D.unit_offset >= 0.99:
		playing = false
		emit_signal('done')


func _on_LevelGUI_speed_change(new_speed):
	speed = new_speed * 2


func _on_LevelGUI_car_1():
	car = 1


func _on_LevelGUI_car_2():
	car = 2
