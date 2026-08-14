extends Node
class_name EventTrigger

enum TriggerType {
	MANUAL,
	BUTTON,
	AREA_ENTER
}

@export var trigger_type: TriggerType = TriggerType.MANUAL

@export_category("Area Settings")
@export var required_body: Node


func _ready() -> void:
	match trigger_type:
		TriggerType.BUTTON:
			var button := get_parent() as TextureButton

			if button == null:
				push_warning(
					"EventTrigger is set to BUTTON, " +
					"but its parent is not a TextureButton."
				)
				return

			button.pressed.connect(execute)

		TriggerType.AREA_ENTER:
			var area := get_parent() as Area2D

			if area == null:
				push_warning(
					"EventTrigger is set to AREA_ENTER, " +
					"but its parent is not an Area2D."
				)
				return

			area.body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	if required_body == null:
		execute()
		return

	if required_body == body:
		execute()


func execute() -> void:
	for child in get_children():
		if child is EventAction:
			child.execute()
