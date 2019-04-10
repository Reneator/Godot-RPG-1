extends Node
class_name ProcessorDamage

var ProcessorStats = load("res://Prefabs/Controllers/Processors/ProcessorStats.gd")
var ProcessorEquipment = load("res://Prefabs/Controllers/Processors/ProcessorEquipment.gd")


func _ready():
	pass # Replace with function body.


static func process_damage(attacker, victim):
	var attackerNode = attacker.get_parent()
	var damage = ProcessorEquipment.get_damage_value(attacker, victim)
	
	var strength = ProcessorStats.get_value_for_stat(attacker, victim, "strength")
	damage += strength
	
	return damage
