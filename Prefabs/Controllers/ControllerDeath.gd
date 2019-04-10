extends Node
class_name ControllerDeath


func _on_death_resolve(killer, victim):
	if(victim.get_parent().name == "Player"):
		get_tree().reload_current_scene()
	victim.get_parent().get_parent().remove_child(victim.get_parent())
	if(killer.is_in_group("rewardable")):
		killer.get_node("Rewardable").reward(victim)
	
