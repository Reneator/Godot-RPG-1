extends Node

var Item = load("res://Prefabs/Item/Item.gd")

const itemDictionary = {
		
	0: {
		name =  "DiamondGreen",
		value =  100,
		item_type = Enums.ITEM_TYPE.ITEM,
		model =  "res://Prefabs/Item/Models/ModelDiamondGreen.tscn",
		sprite = null,
		icon =  "res://Assets/Items/platformPack_Item009.png",
		stack_max_size =  10
	},
	1 :{
		name =  "DiamondRed",
		value =  100,
		item_type = Enums.ITEM_TYPE.ITEM,
		model =  "res://Prefabs/Item/Models/ModelDiamondRed.tscn",
		sprite = null,
		icon =  "res://Assets/Items/platformPack_Item010.png",
		stack_max_size =  10
	},
	2 : {
		name =  "Sword",
		value =  100,
		item_type = Enums.ITEM_TYPE.EQUIPMENT,
		model =  "res://Prefabs/Item/Models/ModelTemplate.tscn",
		sprite = "res://Assets/selfmade/hero1_40px.png",
		icon =  "res://Assets/selfmade/hero1_40px.png",
		stack_max_size =  1,
		equipment_stats = {
			effects = [],
			
		}
	},
	3 : {
		name =  "Helmet",
		value =  100,
		item_type = Enums.ITEM_TYPE.EQUIPMENT,
		model =  "res://Prefabs/Item/Models/ModelDiamondRed.tscn",
		sprite = null,
		icon =  "res://Assets/Items/platformPack_Item010.png",
		stack_max_size =  1,
		effects = []
	},
}
#
func get_item(id):
	var itemDefinition = itemDictionary[id]
	if(itemDefinition == null):
		return null

	var item = Item.new()
	item.id = id
	item.item_name = itemDefinition.name
	item.value = itemDefinition.value
	item.model = itemDefinition.model
	item.icon = itemDefinition.icon
	if(itemDefinition.stack_max_size):
		item.stack_max_size = itemDefinition.stack_max_size
	else:
		item.stack_max_size = 1

	if(itemDefinition.sprite):
		item.sprite = itemDefinition.sprite
	return item
#
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

