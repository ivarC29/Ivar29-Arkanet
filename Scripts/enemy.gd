extends Area2D

@export var points = 50

func set_explotion():
	collision_mask = 0
	collision_layer = 0
	$AnimatedSprite2D.animation = "explotion"
	await $AnimatedSprite2D.animation_finished
	queue_free()
