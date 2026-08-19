extends Resource
class_name SaveData

# Where the player currently is
@export var current_room: String = "PlantRoom"
@export var current_view: String = "North"

# Player inventory
@export var inventory: Array[String] = []

# Puzzles that have been completed
@export var completed_puzzles: Array[String] = []

# General persistent world state
@export var world_state: Dictionary = {}
