extends Node
class_name ControllerDamage

var ProcessorDamage = load("res://Prefabs/Controllers/Processors/ProcessorDamage.gd")

func _on_damage_resolve(attacker, victim):
#	print ("ControllerDamage resolved the damaging")
	var damage = ProcessorDamage.process_damage(attacker, victim)
#	print ("Damage Calculated is " + str(damage))
	#Calculate Damage
	victim.set_hp(victim.hp - damage)
	if(victim.hp <= 0):
		if (victim.invincible):
			victim.hp = 1
		else:
			victim.die(attacker)