extends Node
class_name ProcessorEffects

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

static func process_effects(attacker, victim, category, value, effects):
	var curr_value = value
	for effect in effects:
		curr_value = effect.process_stat_effect(attacker, victim, category, curr_value)
		print("Current Value for "+ effect.type_name + ": "+str(curr_value))
	return curr_value