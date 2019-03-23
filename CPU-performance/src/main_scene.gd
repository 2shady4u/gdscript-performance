extends Node2D

onready var _bullet_scene = preload("res://src/Bullet.tscn")

const SPEED = 10
const BULLETS_PER_FRAME = 10

var _number_of_bullets = 0

func _ready():
	Engine.set_target_fps(0)

func _input(event):
	if event.is_action("ui_up"):
		$Sprite.position.y -= SPEED
	elif event.is_action("ui_down"):
		$Sprite.position.y += SPEED
	elif event.is_action("ui_left"):
		$Sprite.position.x -= SPEED
	elif event.is_action("ui_right"):
		$Sprite.position.x += SPEED

func _process(__):
	$Label.text = "FPS: " + String(Performance.get_monitor(Performance.TIME_FPS))
	$Label.text += " (" + String(_number_of_bullets) + " Instances)";

	var bullet
	var position = $Sprite.position

	for i in range(0,BULLETS_PER_FRAME):
		bullet = _bullet_scene.instance()
		bullet.position = position
		bullet.direction_vector = Vector2(sin(deg2rad(i * 36)), cos(deg2rad(i * 36)))
		bullet.speed = int(rand_range(0.0, 10.0))
		bullet.rotation_degrees = int(rand_range(0.0, 360.0))

		$Bullets.add_child(bullet)
		_number_of_bullets += 1
		bullet.set_process(true)

