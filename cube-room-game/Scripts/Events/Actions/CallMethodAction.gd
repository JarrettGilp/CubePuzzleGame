extends EventAction
class_name CallMethodAction


@export var targets: Array[Node] = []
@export var method_name: String
@export var arguments: Array[Variant] = []


func execute() -> void:
	if method_name.is_empty():
		push_warning("CallMethodAction has no method name.")
		return

	for target in targets:
		if target == null:
			continue

		if not target.has_method(method_name):
			push_warning(
				"Node '%s' does not have method '%s'."
				% [target.name, method_name]
			)
			continue

		target.callv(method_name, arguments)
