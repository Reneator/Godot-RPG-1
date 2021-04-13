extends Node

var ProcessorDamage = load("res://Prefabs/Controllers/Processors/ProcessorDamage.gd")

func _on_damage_resolve(attacker, victim):
#	print ("ControllerDamage resolved the damaging")
	var damage = ProcessorDamage.process_damage(attacker, victim)
#	print ("Damage Calculated is " + str(damage))
	#Calculate Damage
	victim.set_hp(victim.hp - damage)
	ControllerStatistics.add_value("damage",damage)
	if(victim.hp <= 0):
		if (victim.invincible):
			victim.hp = 1
		else:
			victim.die(attacker)
			ControllerStatistics.add_value("kills",1)
