class_name DeathController


func _on_death_resolve(killer, victim):
	victim.get_parent().remove_child(victim)
	killer.reward(victim)
	
func signalConnect(emitter):
	emitter.connect("_on_death",self,"_on_death_resolve")