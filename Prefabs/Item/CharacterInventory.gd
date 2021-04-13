extends Node
class_name CharacterInventory

var slots = [];
var Slot = load("res://Prefabs/Item/EquipmentSlot.gd")
var Item = load("res://Prefabs/Item/Equipment.gd")
var MultiMonsterEffect = load("res://Prefabs/Item/Effects/EffectStatMultiplicationMonsterType.gd")


func _ready():
	get_parent().add_to_group("hasCharacterInventory")
	var weapon_effect = MultiMonsterEffect.new()
	weapon_effect.init_instance("damage", "Wolf",2)
	
	var weapon_item = Item.new()
	weapon_item.effects.append(weapon_effect)
	weapon_item.damage = 10
	
	var weapon_slot = Slot.new()
	weapon_slot.item = weapon_item
	
	addSlot(weapon_slot)
	
	addSlotWithType(Enums.EQUIPMENT_SLOT_TYPE.WEAPON)
	addSlotWithType(Enums.EQUIPMENT_SLOT_TYPE.HEAD)
	addSlotWithType(Enums.EQUIPMENT_SLOT_TYPE.SHOULDER)
	
	
	
	printCharacterInventoryContent() 
	
	
func printCharacterInventoryContent():
	var printString = "Inventory got initialized with slots: "
	for slot in slots:
		printString += "[Slot: " + str(slot.slotType) + " ], "
	print(printString)


func getSlots(slotType):
	if (slotType == null):
		return slots;
		
	var returnSlots = [];
	for slot in slots:
		if(slot.type == slotType):
			returnSlots.append(slot)
	return slots

func addSlot(_slot):
	slots.append(_slot)

func addSlotWithType(slotType):
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

func get_items():
	var items = []
	for slot in slots:
		if(slot.item != null):
			items.append(slot.item)
	
	return items
