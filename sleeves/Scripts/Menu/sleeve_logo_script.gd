extends Sprite2D

@export var max_scale_speed: float = 0.06   # Maximum speed in the middle of the scale range
@export var min_scale_speed: float = 0.03  # Very slow speed near min and max
@export var scale_factor: float = 0.12      # Maximum scale size
@export var min_scale: float = 0.06         # Minimum scale size
@export var timer: Timer                    # Assign this in the inspector

var scale_direction: float = 1.0
var scale_speed: float = max_scale_speed    # Initial scale speed

func _ready():
	# Start the timer
	timer.start()
	
	# Connect the timer's timeout signal to handle grow/shrink transitions
	timer.timeout.connect(_on_timer_timeout)

func _process(delta):
	# Calculate the midpoint between min_scale and scale_factor
	var midpoint = (scale_factor + min_scale) / 2.0
	
	# Adjust speed: slow down near min_scale and scale_factor, speed up near midpoint
	var distance_to_midpoint = abs(scale.x - midpoint)
	var max_distance = abs(scale_factor - midpoint)
	
	# Use a smooth curve (like a quadratic) to change speed gradually:
	scale_speed = lerp(min_scale_speed, max_scale_speed, pow(distance_to_midpoint / max_distance, 2))

	# Apply scaling with the computed speed
	scale += Vector2(scale_speed, scale_speed) * delta * scale_direction
	
	# Reverse direction when limits are reached
	if scale.x >= scale_factor:
		scale_direction = -1.0  # Shrink
	elif scale.x <= min_scale:
		scale_direction = 1.0   # Grow

func _on_timer_timeout():
	# Adjust timer intervals if needed, or use it to manage other timed behavior
	if scale_direction == 1.0:
		timer.start(0.5)  # Time to complete growth
	else:
		timer.start(0.3)  # Time to complete shrink
