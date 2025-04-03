#CODE TAKEN FROM CHATGPT

extends Sprite2D

var scale_speed: float = 0.06
var scale_factor: float = 0.1
var scale_direction: float = 1.0

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

func _process(delta):
	scale += Vector2(scale_speed, scale_speed) * delta * scale_direction
	if scale.x > 0.12:
		scale_direction = -1.0
	elif scale.x < scale_factor:
		scale_direction = 1.0
	
		
