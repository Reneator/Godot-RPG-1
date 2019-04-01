extends KinematicBody2D

var hp = 100;

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func hit():
	hp -= 10;
	print (hp)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
