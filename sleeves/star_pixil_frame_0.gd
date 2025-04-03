extends Sprite2D
#star textures
var starTexture0 = load("res://Textures/star_pixil-frame-0.png")
var starTexture1 = load("res://Textures/star_pixil-frame-1.png")
var starTexture2 = load("res://Textures/star_pixil-frame-2.png")
var lag = 0
#timer function
func wait(seconds: float):
	await get_tree().create_timer(seconds).timeout

# star anim gif
func _ready() -> void:
	while true:
		lag +=1
		if lag==1:
			await wait(randf_range(0.1,0.9))
		await wait(0.3)
		texture = starTexture2
		await wait(0.3)
		texture = starTexture1
		await wait(0.3)
		texture = starTexture0
