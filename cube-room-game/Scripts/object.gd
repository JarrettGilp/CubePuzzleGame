extends Node

# Object Styles
enum Style {
	NULL,
	BLANK,
	CLIPART,
	BRYCE,
	PIXEL,
	FISH,
	HORROR
}

# Object States
enum State {
	UNLOCKED,
	LOCKED
}

# Object attributes
@export var objectID: String
@export var currentLocation: Node
@export var state: State = State.UNLOCKED
@export var style: Style = Style.BLANK
@export var queuedStyle: Style = Style.NULL

# Update check for style changes
func UpdateObjectStyle(objStyle: Style) -> void:
	if state == State.LOCKED:
		queuedStyle = objStyle
	else:
		if queuedStyle != Style.NULL:
			SetStyle(queuedStyle)
			queuedStyle = Style.NULL
		else:
			SetStyle(objStyle)

# Sets the state of the object:
# 	* UNLOCKED (style can change when change checks occur)
#	* LOCKED (style cannot change when change checks occur)
func SetState(objState: State) -> void:
	state = objState

# Sets the style of the object - pertains to the room you are in (*unless LOCKED*)
func SetStyle(objStyle: Style) -> void:
	style = objStyle

# Sets current location of the object
func SetCurrentLocation(locationNode: Node) -> void:
	currentLocation = locationNode
