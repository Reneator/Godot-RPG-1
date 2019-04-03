extends Node

var hp = 100;

signal _on_hit(hp)
signal _on_death()

func _ready():
	get_parent().add_to_group("hittable")

func hit():
	print (get_parent().name + " got hit!")
	hp -= 10	
	emit_signal("_on_hit", hp)
	if(hp <= 0):
		emit_signal("_on_death")
	
#	get_parent().get_parent().remove_child(get_parent())

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass