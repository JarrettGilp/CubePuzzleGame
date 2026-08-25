extends Node
class_name Inventory

var inventory: Array[GameObject] = []
@export var slotCount: int = 10


func _ready() -> void:
	inventory.resize(slotCount)

func GetSaveData() -> Array[String]:
	var save_inventory: Array[String] = []

	for obj in inventory:
		if obj == null:
			save_inventory.append("")
		else:
			save_inventory.append(obj.objectID)

	return save_inventory

func AddObject(obj: GameObject) -> bool:
	if obj == null:
		return false

	if inventory.has(obj):
		return false

	for i in range(inventory.size()):
		if inventory[i] == null:
			inventory[i] = obj
			obj.SetCurrentLocation(self)
			return true

	return false


func RemoveObject(obj: GameObject) -> bool:
	if obj == null:
		return false

	for i in range(inventory.size()):
		if inventory[i] == obj:
			inventory[i] = null
			return true

	return false


func HasObject(obj: GameObject) -> bool:
	return inventory.has(obj)


func GetObject(objectID: String) -> GameObject:
	for obj in inventory:
		if obj != null and obj.objectID == objectID:
			return obj

	return null
	

func GetObjectAtSlot(slot: int) -> GameObject:
	if slot < 0 or slot >= inventory.size():
		return null

	return inventory[slot]


func IsSlotEmpty(slot: int) -> bool:
	if slot < 0 or slot >= inventory.size():
		return false

	return inventory[slot] == null


func IsFull() -> bool:
	for obj in inventory:
		if obj == null:
			return false

	return true
