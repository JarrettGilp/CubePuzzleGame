extends Node2D
class_name WorldController

var current_room: RoomController = null


func _ready() -> void:
	for child in get_children():
		if child is RoomController:
			current_room = child
			break

	if current_room == null:
		print("No RoomController found in WorldController.")


func change_room(room_name: String, target_view: String) -> void:
	var room := get_node_or_null(room_name) as RoomController

	if room == null:
		print("Could not find room: ", room_name)
		return

	if current_room != null:
		current_room.visible = false
		current_room.process_mode = Node.PROCESS_MODE_DISABLED

	current_room = room

	current_room.visible = true
	current_room.process_mode = Node.PROCESS_MODE_INHERIT

	SaveManager.data.current_room = room_name

	current_room.change_view(target_view)
