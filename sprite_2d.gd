extends Sprite2D



func _process(delta):
	pass
	#rotation += angular_speed * delta
	#var velocity = Vector2.UP.rotated(rotation) * speed
	#position += velocity * delta


func _on_button_pressed() -> void:
	print("Pressed")
	set_process(not is_processing())
