extends EventAction
class_name CallMethodAction

@export var target: NodePath
@export var method_name: String
@export var arguments: Array[Variant] = []


func execute(trigger: Node) -> void:
	var node := trigger.get_node_or_null(target)

	if node == null:
		push_warning("CallMethodAction could not find target: " + str(target))
		return

	if method_name.is_empty():
		push_warning("CallMethodAction has no method name.")
		return

	if not node.has_method(method_name):
		push_warning(
			"Node '%s' does not have method '%s'."
			% [node.name, method_name]
		)
		return

	node.callv(method_name, arguments)
