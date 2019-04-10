extends Node

var Item = load("res://Prefabs/Item/Item.gd")

const itemDictionary = {
		
	0: {
		name =  "DiamondGreen",
		value =  100,
		model =  "res://Prefabs/Item/Models/ModelDiamondGreen.tscn",
		icon =  "res://Assets/Items/platformPack_Item009.png",
		stack_max_size =  10
	}
}

func get_item(id):
	var itemDefinition = itemDictionary[id]
	if(itemDefinition == null):
		return null
	
	var item = Item.new()
	item.item_name = itemDefinition.name
	item.value = itemDefinition.value
	item.model = itemDefinition.model
	item.icon = itemDefinition.icon
	item.stack_max_size = itemDefinition.stack_max_size
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
