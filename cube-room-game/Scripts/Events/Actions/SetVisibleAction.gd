extends EventAction
class_name SetVisibleAction

@export var target: Node
@export var visible: bool = true


func execute() -> void:
	if target == null:
		push_warning("SetVisibleAction has no target assigned.")
		return

	if target is CanvasItem:
		target.visible = visible
	else:
		push_warning("Target is not a CanvasItem: " + str(target))
