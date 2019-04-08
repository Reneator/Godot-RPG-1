extends Node
class_name DamageController


func _on_damage_resolve(attacker, victim):
	print ("DamageController resolved the damaging")
	#Calculate Damage
	victim.set_hp(victim.hp - 10)
	if(victim.hp <= 0):
		if (victim.invincible):
			victim.hp = 1
		else:
			victim.die(attacker)