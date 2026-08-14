extends EventAction
class_name SetActiveAction

@export var target: NodePath
@export var active: bool = true


func execute(trigger: Node) -> void:
	var node := trigger.get_node_or_null(target)

	if node == null:
		push_warning("SetActiveAction could not find target: " + str(target))
		return

	node.process_mode = (
		Node.PROCESS_MODE_INHERIT
		if active
		else Node.PROCESS_MODE_DISABLED
	)
