extends Node


var items = []
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
	items.append(item)
	print("Item added: Name: " + item.item_name + " Value: " + str(item.value) + " added to Inventory!")
#	print(str(items));
