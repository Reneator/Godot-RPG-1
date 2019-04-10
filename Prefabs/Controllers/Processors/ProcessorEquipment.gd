extends Node
class_name ProcessorEquipment

var ProcessorEffects = load("res://Prefabs/Controllers/Processors/ProcessorEffects.gd")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


static func get_damage_value(attacker, victim):
	var equipped_items_attacker = attacker.get_node("CharacterInventory").get_items()
	var damage = 0
	print (str(equipped_items_attacker))
		
	for item in equipped_items_attacker:
		damage += item.damage
	
	print("Damage from equipment: " + str(damage))
	
	var effects = []
	for item in equipped_items_attacker:
		for item2 in item.get_effects_for_category("damage"):
			effects.append(item2)
	
	damage = ProcessorEffects.process_effects(attacker, victim, "damage", damage, effects)
	return damage