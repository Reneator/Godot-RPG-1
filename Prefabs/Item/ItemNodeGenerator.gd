extends Node
class_name ItemNodeGenerator

var itemScene = preload("res://Prefabs/Item/Item.tscn")
var collectableScene = preload("res://Prefabs/Interfaces/Collectable.tscn")

var itemObject = load("res://Prefabs/Item/Item.gd")


func _ready():
	pass # Replace with function body.


#Generate Item-class, and define model. Item only exists as class while in inventory, 
#and when it gets dropped the model gets created
func generateItem(itemValue, itemName, model):
	var newItem = itemObject.new()
#	newItem.get_child("Sprite").Texture =
#	newItem.setSprite = preload()

func generateItemNode(item):
	var node = load(item.model).instance()
	
	var collectableI = collectableScene.instance()
	node.call_deferred("add_child",collectableI)
	
	var itemNode = itemScene.instance()
	itemNode.id = item.id
	itemNode.item_name = item.item_name
	itemNode.value = item.value
	itemNode.model = item.model
	itemNode.item_stack_id = item.item_stack_id
	itemNode.stack_max_size = item.stack_max_size
#	itemNode.get_node()
	node.call_deferred("add_child",itemNode)
	return node
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
