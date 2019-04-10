extends Effect
class_name EffectStatMultiplication




func _ready():
	pass # Replace with function body.



func process_effect(attacker, victim, _stat_name, _stat_base_value):
	if(stat_name != _stat_name):
		return _stat_base_value
#	var stat_value = attacker.get("CharacterStats").get_current_value(stat_name)
	process_stat_effect(attacker, victim, _stat_name, _stat_base_value)

func process_stat_effect(attacker, victim, stat_name, stat_value):
	pass
		