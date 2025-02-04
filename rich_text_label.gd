extends RichTextLabel
# Node reference for the RichTextLabel
@export var label: RichTextLabel

# Flashing interval (in seconds)
@export var flash_interval: float = 1  # Adjust for faster/slower flashing

# Keep track of the flashing state
var label_visible: bool = true

func _ready() -> void:
	# Ensure the label is assigned
	if label == null:
		label = $RichTextLabel  # Replace with the correct path if necessary
	
	# Set up a timer for flashing
	var timer = Timer.new()
	timer.wait_time = flash_interval
	timer.one_shot = false
	add_child(timer)
	timer.start()
	
	# Connect the timer's timeout signal using a Callable
	timer.timeout.connect(_on_flash_timeout)

func _on_flash_timeout() -> void:
	# Toggle the visibility of the label
	if label:
		label_visible = !label_visible
		label.visible = label_visible

func _process(_delta: float) -> void:
	# No frame-based logic here, so suppress the warning
	pass
