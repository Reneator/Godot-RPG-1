extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const itemImages = [
	preload("res://images/Ac_Ring05.png"),
	preload("res://images/A_Armor05.png"),
	preload("res://images/A_Armour02.png"),
	preload("res://images/A_Shoes03.png"),
	preload("res://images/C_Elm03.png"),
	preload("res://images/E_Wood02.png"),
	preload("res://images/P_Red02.png"),
	preload("res://images/W_Sword001.png")
];


const itemDictionary = {
	0: {
		"itemName": "Ring",
		"itemValue": 456,
		"itemIcon": itemImages[0]
	},
	1: {
		"itemName": "Sword",
		"itemValue": 100,
		"itemIcon": itemImages[7]
	},
	2: {
		"itemName": "Iron Ring",
		"itemValue": 987,
		"itemIcon": itemImages[0]
	},
};


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
