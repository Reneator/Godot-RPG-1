extends Node
class_name Hitable

var hp = 100;

signal _on_hit(attacker, victim)
signal _on_death(killer, victim)

var invincible = false



func _ready():
	
	self.connect("_on_hit", HitController, "_on_hit_resolve")
	self.connect("_on_death", DeathController, "_on_death_resolve")
	connect("_on_hit", self, "Waaaagh")	
#	DeathController.signalConnect(self)
#	HitController.signalConnect(self)
	get_parent().add_to_group("hitable")

func hit(other):
	print (get_parent().name + " got hit by "+ other.name + " !")
	hp -= 10
	emit_signal("_on_hit", other, self)
	
	
func die(killer):
	emit_signal("_on_death", killer, self)
	
#	get_parent().get_parent().remove_child(get_parent())

func Waaaagh(killer, victim):
	print ("Waaaagh")
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass