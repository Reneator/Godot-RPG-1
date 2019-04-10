extends Node
class_name ProcessorStats

func _ready():
	pass # Replace with function body.

#Statname would be Strength etc.
static func get_value_for_stat(attacker, victim, statName):
	var stat_value = 0
	if(attacker.is_in_group("hasCharacterStats")):
		stat_value = attacker.get_node("CharacterStats").get_current_value(statName)
	
	return stat_value
	
	
	
	
	