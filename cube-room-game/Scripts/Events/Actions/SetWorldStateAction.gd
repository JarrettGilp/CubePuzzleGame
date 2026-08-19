extends EventAction
class_name SetWorldStateAction


@export var state_id: String
@export var value: bool = true
@export var save_immediately: bool = true


func execute() -> void:
	if state_id.is_empty():
		push_warning("SetWorldStateAction has no state ID.")
		return

	SaveManager.data.world_state[state_id] = value

	print("World state changed: ", state_id, " = ", value)

	if save_immediately:
		SaveManager.save_game()
