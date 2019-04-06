extends Node
class_name CharacterInventory

var slots = [];

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	var Slot = load("res://Prefabs/Item/CharacterEquipmentSlot.gd")
	
	var slot1 = Slot.new()
	slot1.init("HEAD")
	slots.append(slot1)
	
	var slot2 = Slot.new()
	slot2.init("SHOULDER")
	slots.append(slot2)
	
	printCharacterInventoryContent()
	
	
func printCharacterInventoryContent():
	var printString = "Inventory got initialized with slots: "
	
	for slot in slots:
		printString += "[Slot: " + slot.type + " ], "
	print(printString)

