extends EventAction
class_name SetVisibleAction


@export var targets: Array[Node] = []
@export var visible: bool = true


func execute() -> void:
	for target in targets:
		if target == null:
			continue

		if target is CanvasItem:
			target.visible = visible
		else:
			push_warning(
				"Target is not a CanvasItem: " + str(target)
			)
