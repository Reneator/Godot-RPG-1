extends Node
class_name HitController


var blubb

func _on_hit_resolve(attacker, victim):
	
	print ("Hitcontroller: Attacker: " + attacker.name + " Victim: "+ victim.name)
	
	var victimHp = victim.hp
	if(victimHp <= 0):
		if (victim.invincible):
			victim.hp = 1
		else:
			victim.die(attacker)
#			victim.emit_signal("_on_death", attacker, victim)
	