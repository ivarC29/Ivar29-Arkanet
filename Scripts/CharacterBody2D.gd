extends CharacterBody2D

@export var SPEED = 600

@onready var playback = $AnimationTree.get("parameters/playback")

var move = Vector2(0,0)

func _get_input():
	move = Vector2.ZERO
	
	if Input.is_action_pressed("move_right"):
		move.x += SPEED
		playback.travel("move_right")
	if Input.is_action_pressed("move_left"):
		move.x -= SPEED
		playback.travel("move_left")
	if Input.is_action_pressed("move_up"):
		move.y -= SPEED
	if Input.is_action_pressed("move_down"):
		move.y += SPEED
	
	if move == Vector2.ZERO:
		playback.start("RESET")
	

func _physics_process(_delta):
	_get_input()
	move = move_and_collide(move * _delta)

	if move:
		playback.start("on_attack")


