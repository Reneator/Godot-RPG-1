extends Node
class_name Effect

var priority
var stat_name


func init(_stat_name):
	stat_name = _stat_name
	
func _ready():

	pass # Replace with function body.


func process_effect(attacker, victim, category, base_value):
	pass