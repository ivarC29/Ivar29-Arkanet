extends Area2D

@export var SPEED = 500
@export var points = 50

@onready var player = get_tree().get_nodes_in_group("player")

var move = Vector2.ZERO

func set_explotion():
	collision_mask = 0
	collision_layer = 0
	$AnimatedSprite2D.animation = "explotion"
	await $AnimatedSprite2D.animation_finished
	queue_free()

func _physics_process(delta):
	var player_position = player[0].global_position
	global_position = global_position.move_toward(player_position, SPEED*delta)
