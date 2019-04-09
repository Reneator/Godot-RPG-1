extends Node


var strength
var dexterity
var endurance
var willpower
var statPoints

var stats = {
	strength = {
		baseValue = 10,
		allocatedPoints = 0,
		}
}


func _ready():
	get_parent().add_to_group("hasCharacterStats")
	print (str(stats))
	add_value("strength", 10)
	print ("Current Value"+ str(get_current_value("strength")))
	pass # Replace with function body.


func add_value(statName, value):
	print (str(stats[statName]))
	stats[statName].allocatedPoints+=value
	print (str(stats[statName]))	
	
func get_current_value(statName):
	return stats[statName].allocatedPoints + stats[statName].baseValue