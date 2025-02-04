extends Sprite2D

# Node reference for the arm
@export var arm: Sprite2D

# Amplitude and speed of the "nah nah nah" motion
@export var wag_amplitude: float = 20.0  # Degrees
@export var wag_speed: float = 4.0  # Oscillations per second

# Keep track of elapsed time
var elapsed_time: float = 0.0



func _process(delta: float) -> void:
	elapsed_time += delta/10
	rotation_degrees = wag_amplitude * sin(elapsed_time * wag_speed * TAU)
