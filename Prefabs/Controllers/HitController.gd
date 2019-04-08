extends Node
class_name HitController


var blubb

func _on_hit_resolve(attacker, victim):
	print ("Hitcontroller: Attacker: " + attacker.name + " Victim: "+ victim.name)
	victim.damage(attacker)
	