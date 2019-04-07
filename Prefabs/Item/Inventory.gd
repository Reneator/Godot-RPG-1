extends Node


var items = []
var size  = 20;

var ItemGenerator = load("res://Prefabs/Item/ItemGenerator.gd").new()
var ItemSlot = load("res://Prefabs/Item/ItemSlot.gd")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func add_item(item):
	if (items.size() >= size):
		return false
#	var itemSlot = ItemSlot.new()
#	itemSlot.item = item
	items.append(item)
	print("Item added: Name: " + item.item_name + " Value: " + str(item.value) + " added to Inventory!")
	return true
#	print(str(items));

func drop_item(id):
	var item = get_item(id)
	items.erase(item)
	return ItemGenerator.generateItemNode(item)
	
func remove_item(item):
	items.erase(item)
	
func return_and_remove_item_node(id):
	var item = get_item(id)
	items.erase(item)
	return ItemGenerator.generateItemNode(item)
	
func return_and_remove_last_item_node():
	if (items.empty()):
		return null
	var item = items[items.size()-1]
	items.erase(item)
	return ItemGenerator.generateItemNode(item)

func get_item(id):
	for item in items:
		if(item.id == id):
			return item
	return null
	


func print_items():
	var printString = "Items in Inventory: ["
	for item in items:
		printString += str(item) + ", "
	printString += "]"
	print (printString)