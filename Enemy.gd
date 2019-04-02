extends KinematicBody2D

var hp = 100;

signal on_hit(string);

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$SignalTriggeredText.change_text("Enemy Hp!")
	pass # Replace with function body.


func hit():
	hp -= 10;
	print (hp)
	emit_signal("on_hit", hp);
	if(hp <= 0):
		print ("Enemy died")
		get_parent().remove_child(self)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Replace with function body.
