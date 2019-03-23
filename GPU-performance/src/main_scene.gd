extends Node2D

onready var _viktor_scene = preload("res://src/Viktor.tscn")
onready var _item_scene = preload("res://src/Item.tscn")

onready var _screen_size = OS.get_screen_size()

const NUMBER_OF_VIKTORS = 3

var _animations
var _frame_count

func _ready():
	var viktor = _viktor_scene.instance()
	_animations = viktor.frames.get_animation_names()
	
	var item = _item_scene.instance()
	_frame_count = item.frames.get_frame_count("default")
	
	reset_test()	

func _process(__):
	$Label.text = "FPS: " + String(Performance.get_monitor(Performance.TIME_FPS))

func _input(event):
	if (event is InputEventKey and !event.echo and event.is_pressed()):
		reset_test()	

func reset_test():
	#first clear the room!
	for child in $Sprites.get_children():
		$Sprites.remove_child(child)
		child.queue_free()
	
	randomize()
	
	add_viktors()	
	add_items()
		
	add_background("options");
	add_background("black");
	add_background("gui");

func add_viktors():
	
	var viktor
	for animation in _animations:
		for viktor_idx in range(0,NUMBER_OF_VIKTORS):
			viktor = _viktor_scene.instance()
			viktor.position.x = int(rand_range(0.0 , _screen_size.x))
			viktor.position.y = int(rand_range(0.0 , _screen_size.y))
			viktor.play(animation)
			viktor.z_index = 0
			$Sprites.add_child(viktor)


func add_background(background_name):
	var background = Sprite.new()
	background.centered = false
	background.texture = load("res://assets/backgrounds/bcg_" + background_name + ".png")
	background.z_index = -2
	$Sprites.add_child(background)
	
func add_items():
	var item
	
	for frame_idx in range(0,_frame_count):
		item = _item_scene.instance()
		item.position.x = int(rand_range(0.0 , _screen_size.x))
		item.position.y = int(rand_range(0.0 , _screen_size.y))
		item.z_index = -1
		item.frame = frame_idx
		$Sprites.add_child(item)

