extends Node


var item_slots = []
var size  = 20;

var ItemNodeGenerator = load("res://Prefabs/Item/ItemNodeGenerator.gd").new()
var ItemSlot = load("res://Prefabs/Item/ItemSlot.gd")


func _ready():
	get_parent().add_to_group("hasInventory")


func add_item(item):		
	var itemSlot = find_item_slot_for_item(item)
	
	if(itemSlot == null):
		if (item_slots.size() >= size):
			return false
			
		itemSlot = add_item_slot()
	
	if(itemSlot == null):
		return false
	itemSlot.add_item(item)
#	print("Item added: Name: " + item.name + " Value: " + str(item.value) + " added to Inventory!")
	return true

func add_items(items):
	for item in items:
		add_item(item)

func add_item_slot():
	if (item_slots.size() >= size):
		return null
	
	var item_slot = ItemSlot.new()
	item_slots.append(item_slot)
	return item_slot


func drop_item(id):
	var item = get_item(id)
	item_slots.erase(item)
	return ItemNodeGenerator.generateItemNode(item)
	
	
func remove_item(item):
	item_slots.erase(item)
	
	
func return_and_remove_item_node(id):
	var item = get_item(id)
	item_slots.erase(item)
	return ItemNodeGenerator.generateItemNode(item)
	
	
func return_and_remove_last_item_node():
	if (item_slots.empty()):
		return null
	var itemSlot = item_slots[item_slots.size()-1]
	var item = itemSlot.item
	if(itemSlot.stack_size == 1):
		item_slots.erase(itemSlot)
	else:
		itemSlot.decrease_stack_size(1)
		
	return ItemNodeGenerator.generateItemNode(item)


func get_item(id):
	for item in item_slots:
		if(item.id == id):
			return item
	return null


func print_item_slots():
	var printString = "Items in Inventory: ["
	for item in item_slots:
		printString += "item:" + item.item.item_name + " stacksize: "+ str(item.stack_size) + ", "
	printString += "]"
	print (printString)


func find_item_slot_for_item(item):
	var foundItemSlot = null
	for itemSlot in item_slots:
		if(itemSlot.item.id == item.id):
			foundItemSlot = itemSlot
			if(foundItemSlot.stack_size >= item.stack_max_size):
				foundItemSlot = null
			else:
				break

	return foundItemSlot
	
	
