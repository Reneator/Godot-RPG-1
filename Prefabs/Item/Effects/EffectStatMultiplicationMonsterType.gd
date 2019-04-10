extends EffectStatMultiplication
class_name EffectStatMultiplicationMonsterType


var type_name
var stat_multi


func _ready():
	pass # Replace with function body.

func init_instance(_stat_name, _type_name, _stat_multi):
	type_name = _type_name
	stat_multi = _stat_multi
	.init(_stat_name)



func process_stat_effect(attacker, victim, stat_name, stat_value):
	if(victim.get_parent().monsterType == type_name):
		return stat_value * stat_multi
	return stat_value
		