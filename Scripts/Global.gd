extends Node

var points = 0
var lives = 3

func remove_live():
	if lives > 1:
		lives -= 1
	else:
		print("You lose")
	print("Lives: ", lives)

func add_points(value):
	points += value
	print("Points: ", points)
