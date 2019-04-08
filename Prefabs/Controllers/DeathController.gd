extends Node
class_name DeathController


func _on_death_resolve(killer, victim):
	victim.get_parent().get_parent().remove_child(victim.get_parent())
	if(killer.is_in_group("rewardable")):
		killer.get_node("Rewardable").reward(victim)
	
