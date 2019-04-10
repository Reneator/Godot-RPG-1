extends Node

var Item = load("res://Prefabs/Item/Item.gd")

const itemDictionary = {
		
	0: {
		name =  "DiamondGreen",
		value =  100,
		item_type = Enums.ITEM_TYPE.ITEM,
		model =  "res://Prefabs/Item/Models/ModelDiamondGreen.tscn",
		icon =  "res://Assets/Items/platformPack_Item009.png",
		stack_max_size =  10
	},
	1 :{
		name =  "DiamondRed",
		value =  100,
		item_type = Enums.ITEM_TYPE.ITEM,
		model =  "res://Prefabs/Item/Models/ModelDiamondRed.tscn",
		icon =  "res://Assets/Items/platformPack_Item010.png",
		stack_max_size =  10
	},
	2 : {
		name =  "Sword",
		value =  100,
		item_type = Enums.ITEM_TYPE.EQUIPMENT,
		model =  "res://Prefabs/Item/Models/ModelDiamondRed.tscn",
		icon =  "res://Assets/Items/platformPack_Item010.png",
		stack_max_size =  1,
		effects = []
		#TODO: Generation of items
	},
	3 : {
		name =  "Helmet",
		value =  100,
		item_type = Enums.ITEM_TYPE.EQUIPMENT,
		model =  "res://Prefabs/Item/Models/ModelDiamondRed.tscn",
		icon =  "res://Assets/Items/platformPack_Item010.png",
		stack_max_size =  1,
		effects = []
		#TODO: Generation of items
	},
}

static func get_item(id):
	var itemDefinition = itemDictionary[id]
	if(itemDefinition == null):
		return null
	
	var item = Item.new()
	item.id = id
	item.item_name = itemDefinition.name
	item.value = itemDefinition.value
	item.model = itemDefinition.model
	item.icon = itemDefinition.icon
	item.stack_max_size = itemDefinition.stack_max_size
	return item
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

