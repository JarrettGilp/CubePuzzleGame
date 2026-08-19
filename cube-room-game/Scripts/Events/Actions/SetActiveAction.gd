extends EventAction
class_name SetActiveAction


@export var targets: Array[Node] = []
@export var active: bool = true


func execute() -> void:
	for target in targets:
		if target == null:
			continue

		target.process_mode = (
			Node.PROCESS_MODE_INHERIT
			if active
			else Node.PROCESS_MODE_DISABLED
		)
