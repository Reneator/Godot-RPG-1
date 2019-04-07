extends KinematicBody2D

var hp = 100;

signal on_hit(string);

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$SignalTriggeredText.set_text("Enemy Hp!")
	$AnimatedSprite.playing = true
	pass # Replace with function body.


#func hit():
#	hp -= 10;
#	print (hp)
#	emit_signal("on_hit", hp);
#	if(hp <= 0):
#		print ("Enemy died")
#		get_parent().remove_child(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Replace with function body.




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
