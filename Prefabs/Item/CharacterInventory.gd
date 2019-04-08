extends Node
class_name CharacterInventory

var slots = [];
var Slot = load("res://Prefabs/Item/EquipmentSlot.gd")


func _ready():
	get_parent().add_to_group("hasCharacterInventory")
	
	addSlot("WOW")
	addSlot("HEAD")
	addSlot("SHOULDER")
	
	printCharacterInventoryContent() 
	
func printCharacterInventoryContent():
	var printString = "Inventory got initialized with slots: "
	for slot in slots:
		printString += "[Slot: " + slot.slotType + " ], "
	print(printString)


func getSlots(slotType):
	if (slotType == null):
		return slots;
		
	var returnSlots = [];
	for slot in slots:
		if(slot.type == slotType):
			returnSlots.append(slot)
	return slots


func addSlot(slotType):
	var newSlot = Slot.new()
	newSlot.slotType = slotType
	slots.append(newSlot);


func addEquipmentSlot(slot):
	slots.append(slot);


func getById(id):
	if (id == null):
		print ("ERROR: id is null!")

	var returnSlot = null;
	for slot in slots:
		if(slot.id == id):
			returnSlot = slot
	return returnSlot;
