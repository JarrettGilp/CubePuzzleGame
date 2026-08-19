extends TextureButton

enum NavigationType {
	VIEW,
	ROOM
}

@export var navigation_type: NavigationType = NavigationType.VIEW

@export_group("View Navigation")
@export var target_view: String = ""

@export_group("Room Navigation")
@export var target_room: String = ""
@export var target_room_view: String = ""


func _pressed() -> void:

	if navigation_type == NavigationType.VIEW:
		var room_controller := get_tree().get_first_node_in_group("room_controller") as RoomController

		if room_controller == null:
			print("Room Controller not found!")
			return

		if target_view.is_empty():
			print("No target view assigned!")
			return

		room_controller.change_view(target_view)


	elif navigation_type == NavigationType.ROOM:
		var world_controller := get_tree().get_first_node_in_group("world_controller") as WorldController

		if world_controller == null:
			print("World Controller not found!")
			return

		if target_room.is_empty():
			print("No target room assigned!")
			return

		if target_room_view.is_empty():
			print("No target room view assigned!")
			return

		world_controller.change_room(target_room, target_room_view)
