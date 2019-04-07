extends ItemSlot
class_name EquipmentSlot

var slotType

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func init(newSlotType):
	slotType = newSlotType
