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

func generateItemNode(item: Item):
	var node: RigidBody2D = load(item.model).instance()
	
#	debug_test_replicating()
	
	print ("Generate Item: "+str(item))
	if (item.sprite !=null && !item.sprite.empty()):
		var spriteNode : Sprite = node.get_node("Sprite")
		spriteNode.texture = load(item.sprite)
	var collectableI = collectableScene.instance()
	node.call_deferred("add_child",collectableI)
	
	var itemNode = itemScene.instance()
	itemNode.id = item.id
	itemNode.item_name = item.item_name
	itemNode.value = item.value
	itemNode.model = item.model
	itemNode.stack_max_size = item.stack_max_size
#	itemNode.get_node()
	node.call_deferred("add_child",itemNode)
	return node
	
	
func debug_test_replicating():
	var debug_object = DebugObject.new()
	if(debug_object!=null):
		
		var debug_var_i_want_to_inspect  = debug_object.blubb
		print (str(debug_var_i_want_to_inspect))
		
		var debug_child_node_i_want_to_inspect = get_node("CharacterStats")
		print (str(debug_child_node_i_want_to_inspect))
	
	
class DebugObject:
	var blubb = 5
	var nullObject = null
		
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
