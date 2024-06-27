extends CharacterBody2D

@export var SPEED = 600

@onready var Shoot = preload("res://Scenes/Shoot.tscn")
@onready var SpecialShoot = preload("res://Scenes/special_shoot.tscn")
@onready var playback = $AnimationTree.get("parameters/playback")

var move = Vector2(0,0)
var cooldown = true
var powerUp = false

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
	if Input.is_action_pressed("attack"):
		shooting()
	
	if move == Vector2.ZERO:
		playback.start("RESET")

func shooting():
	if cooldown:
		cooldown = false
		$Timer.start()
		var shoot_instance
		if powerUp:
			shoot_instance = SpecialShoot.instantiate()
		else:
			shoot_instance = Shoot.instantiate()
		shoot_instance.position = $ShootPos.global_position
		add_sibling(shoot_instance)

func _physics_process(_delta):
	_get_input()
	move = move_and_collide(move * _delta)

func take_damage():
	Global.remove_live()
	$AnimationPlayer.play("take_damage")

func _on_timer_timeout():
	cooldown = true

func _on_area_2d_area_entered(area):
	if area.is_in_group("enemy"):
		take_damage()
		area.set_explotion()
