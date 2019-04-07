extends Node
class_name ItemSlot


var item: Item

func _ready():
	pass # Replace with function body.


func  isEmpty():
	return item == null;


func exchangeItem(equipmentSlot):
#	print ("Exchange Items instanceOf ItemSlot: " + (equipmentSlot instanceof ItemSlot))
	var newItem = equipmentSlot.exchange(item);
	exchange(newItem);

func exchange(newItem):
	var currentlyEquipped = newItem;
	item = newItem;
	return currentlyEquipped;