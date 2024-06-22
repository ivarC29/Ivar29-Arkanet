extends Path2D

@export var SPEED = 400
@onready var routes = get_children()

func _physics_process(delta):
	for route in routes:
		route.progress += SPEED * delta
			

