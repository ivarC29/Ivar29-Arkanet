extends RigidBody2D



func _on_area_2d_area_entered(area):
	if area.is_in_group("enemy"):
		Global.add_points(area.points)
		area.set_explotion()
