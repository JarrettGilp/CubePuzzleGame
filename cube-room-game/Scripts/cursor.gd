extends AnimatedSprite2D

var is_clicking: bool = false

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	animation = "default"
	stop()
	frame = 0

func _process(_delta: float) -> void:
	position = get_viewport().get_mouse_position()

	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		if not is_clicking:
			is_clicking = true
			play("click")
	else:
		is_clicking = false
		animation = "default"
		stop()
		frame = 0
