extends Node
class_name Hitable

var hp = 100;

signal _on_hit(attacker, victim)
signal _on_death(killer, victim)
signal _on_damage(attacker, victim)
signal _on_hp_change(hp)

var invincible = false
var killable = true


func _ready():
	
	self.connect("_on_hit", HitController, "_on_hit_resolve")
	self.connect("_on_death", DeathController, "_on_death_resolve")
	self.connect("_on_damage", DamageController, "_on_damage_resolve")
	get_parent().add_to_group("hitable")


func hit(other):
	print (get_parent().name + " got hit by "+ other.name + " !")
	emit_signal("_on_hit", other, self)
	

func die(killer):
	emit_signal("_on_death", killer, self)


func damage(attacker):
	emit_signal("_on_damage", attacker, self)
	

func set_hp(new_hp):
	hp = new_hp
	emit_signal("_on_hp_change", hp)
	