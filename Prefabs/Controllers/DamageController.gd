extends Node
class_name DamageController

var DamageProcessor = load("res://Prefabs/Controllers/Processors/DamageProcessor.gd")

func _on_damage_resolve(attacker, victim):
#	print ("DamageController resolved the damaging")
	var damage = DamageProcessor.process_damage(attacker, victim)
#	print ("Damage Calculated is " + str(damage))
	#Calculate Damage
	victim.set_hp(victim.hp - damage)
	if(victim.hp <= 0):
		if (victim.invincible):
			victim.hp = 1
		else:
			victim.die(attacker)