extends Node

const SAVE_PATH := "user://savegame.json"

var data: SaveData


func _ready() -> void:
	data = SaveData.new()

	print("Save location: ", ProjectSettings.globalize_path(SAVE_PATH))


func save_game() -> void:
	var save_dict := {
		"current_room": data.current_room,
		"current_view": data.current_view,
		"inventory": data.inventory,
		"completed_puzzles": data.completed_puzzles,
		"world_state": data.world_state
	}

	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)

	if file == null:
		push_error("Could not open save file for writing.")
		return

	file.store_string(JSON.stringify(save_dict))
	file.close()

	print("Game saved.")


func load_game() -> bool:
	if not FileAccess.file_exists(SAVE_PATH):
		print("No save file found.")
		return false

	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)

	if file == null:
		push_error("Could not open save file.")
		return false

	var json_text := file.get_as_text()
	file.close()

	var json := JSON.new()

	if json.parse(json_text) != OK:
		push_error("Could not parse save file.")
		return false

	var save_dict: Dictionary = json.data

	data.current_room = save_dict.get("current_room", "PlantRoom")
	data.current_view = save_dict.get("current_view", "North")

	data.inventory.clear()
	data.inventory.append_array(save_dict.get("inventory", []))

	data.completed_puzzles.clear()
	data.completed_puzzles.append_array(
		save_dict.get("completed_puzzles", [])
	)

	data.world_state = save_dict.get("world_state", {})

	print("Game loaded.")

	return true


func delete_save() -> void:
	if FileAccess.file_exists(SAVE_PATH):
		DirAccess.remove_absolute(SAVE_PATH)

	data = SaveData.new()

	print("Save deleted.")
