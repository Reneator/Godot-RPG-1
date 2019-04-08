extends Node
class_name ItemSlot


var item: Item
var stack_size

func _ready():
	pass # Replace with function body.


func  isEmpty():
	return item == null;

func add_item(new_item):
	if (item == null):
		item = new_item
		stack_size = 1
	else:
		stack_size += 1

func exchangeItem(equipmentSlot):
#	print ("Exchange Items instanceOf ItemSlot: " + (equipmentSlot instanceof ItemSlot))
	var newItem = equipmentSlot.exchange(item);
	exchange(newItem);

func exchange(newItem):
	var currentlyEquipped = newItem;
	item = newItem;
	return currentlyEquipped;
	
func increase_stack_size(size):
	stack_size += size

func decrease_stack_size(size):
	stack_size -= size