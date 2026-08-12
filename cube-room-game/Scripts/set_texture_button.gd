extends Sprite2D

@onready var button: TextureButton = $TextureButton

func _ready():
	button.texture_normal = texture
