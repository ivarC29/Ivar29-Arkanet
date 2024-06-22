extends Area2D

@export var SPEED = 500

@onready var player = get_tree().get_nodes_in_group("player")

var move = Vector2.ZERO

func _physics_process(delta):
	var player_position = player[0].global_position
	global_position = global_position.move_toward(player_position, SPEED*delta)
