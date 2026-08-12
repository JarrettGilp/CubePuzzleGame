extends Node

# Room Name (ex. PlantRoom)
@export var room_name: String = "defaultRoom"
# Direction (ex. North)
@export var direction: String = "defaultDir"

func go_to_scene() -> void:
	# Destination scene name
	var destination_scene_path: String = room_name + "/" + direction
	
	var scene_path: String = "res://Scenes/RoomScenes/%s.tscn" % destination_scene_path
	get_tree().change_scene_to_file(scene_path)
