extends Sprite

var speed
var direction_vector = Vector2(1,0)

func _ready():
	set_process(false)

func _process(delta):
	self.position += speed*direction_vector
	self.rotation_degrees += 1