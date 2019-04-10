extends KinematicBody2D

var hp = 100;
var monsterType = "Wolf"
signal on_hit(string);

func _ready():
	$SignalTriggeredText.set_text("Enemy Hp!")
	$AnimatedSprite.playing = true
	pass # Replace with function body.




func _on_DamageArea_body_entered(body):
#	print ("Damage-Area: "+ body.name)
	if(body.is_in_group("hitable") && body != self):
#		print ("Is Hittable" + body.name)
#		print ("Groups of "+ body.name+ ": " + str(body.get_groups()))
		body.find_node("Hitable").hit(self)
	pass # Replace with function body.


func _on_Hitable__on_death():
	get_parent().remove_child(self)
	pass # Replace with function body.
