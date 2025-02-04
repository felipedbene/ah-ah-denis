extends Sprite2D

# Node reference for the arm
@export var arm: Sprite2D

# Amplitude and speed of the "nah nah nah" motion
@export var wag_amplitude: float = 20.0  # Degrees
@export var wag_speed: float = 4.0  # Oscillations per second

# Keep track of elapsed time
var elapsed_time: float = 0.0

func _ready() -> void:
	set_process(false)

func _process(delta: float) -> void:
	elapsed_time += delta/10
	rotation_degrees = wag_amplitude * sin(elapsed_time * wag_speed * TAU)


func _on_button_pressed() -> void:
	#Stop Animation
	set_process(not is_processing())
	
	#Get audio Player
	var audio = get_node("../AudioStreamPlayer")
	var _label = get_node("../RichTextLabel")
	var _button = get_node("../Button")
	var timer = get_node("../Timer")
	
	# Toggle logic for audio
	if(audio.playing) :
		audio.stop()
		_label.hide()
		_button.set_text("Start!")
		timer.stop()
		
	else :
		audio.play()
		_label.show()
		_button.set_text("Pleaaaaase! Stop!!")
		timer.start()
	
	
