extends Node2D
class_name RoomController

@export var starting_view: Node2D

var current_view: Node2D = null


func _ready() -> void:
	if starting_view != null:
		change_view(starting_view.name)


func change_view(view_name: String) -> void:
	var view := get_node_or_null(view_name) as Node2D

	if view == null:
		print("Could not find view: ", view_name)
		return

	for child in get_children():
		if child is Node2D:
			var is_current := child == view

			child.visible = is_current

			if is_current:
				child.process_mode = Node.PROCESS_MODE_INHERIT
			else:
				child.process_mode = Node.PROCESS_MODE_DISABLED

	current_view = view

	# Save current view
	SaveManager.data.current_view = view_name
