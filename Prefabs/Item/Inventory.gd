extends Node


var item_slots = []
var size  = 20;

var ItemGenerator = load("res://Prefabs/Item/ItemGenerator.gd").new()
var ItemSlot = load("res://Prefabs/Item/ItemSlot.gd")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().add_to_group("hasInventory")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func add_item(item):
	if (item_slots.size() >= size):
		return false
		
	var itemSlot = find_item_slot_for_item(item)
	if(itemSlot == null):
		itemSlot = add_item_slot()
	
	if(itemSlot == null):
		return false
	
	itemSlot.add_item(item)
#!!!!I need Itemslot to be able to stack Objects!!!!
#	var itemSlot = ItemSlot.new()
#	itemSlot.item = item
	print("Item added: Name: " + item.item_name + " Value: " + str(item.value) + " added to Inventory!")
	return true
#	print(str(item_slots));

func find_item_slot_for_item(item):
	var foundItemSlot = null
	for itemSlot in item_slots:
		if(itemSlot.item.item_stack_id == item.item_stack_id):
			foundItemSlot = itemSlot
			if(foundItemSlot.stack_size >= item.stack_max_size):
				foundItemSlot = null
			else:
				break
	
	return foundItemSlot


func add_item_slot():
	if (item_slots.size() >= size):
		return null
	
	var item_slot = ItemSlot.new()
	item_slots.append(item_slot)
	return item_slot

func drop_item(id):
	var item = get_item(id)
	item_slots.erase(item)
	return ItemGenerator.generateItemNode(item)
	
	
func remove_item(item):
	item_slots.erase(item)
	
	
func return_and_remove_item_node(id):
	var item = get_item(id)
	item_slots.erase(item)
	return ItemGenerator.generateItemNode(item)
	
	
func return_and_remove_last_item_node():
	if (item_slots.empty()):
		return null
	var itemSlot = item_slots[item_slots.size()-1]
	var item = itemSlot.item
	if(itemSlot.stack_size == 1):
		item_slots.erase(itemSlot)
	else:
		itemSlot.decrease_stack_size(1)
		
	return ItemGenerator.generateItemNode(item)


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
	
	