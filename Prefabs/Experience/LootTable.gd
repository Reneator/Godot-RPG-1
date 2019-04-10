extends Node
class_name LootTable

var expOnDeath = 500;
var goldOnDeath = 100;
var items = []

func _ready():
	get_parent().add_to_group("lootable")
	
#	var item = ItemGenerator.generateItem(1)

func init(_expOnDeath, _goldOnDeath):
	expOnDeath = _expOnDeath
	goldOnDeath = _goldOnDeath