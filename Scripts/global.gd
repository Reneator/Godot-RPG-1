extends Node

var health = 4
signal _on_health_change;
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _set_health(new_health):
	health = new_health
	emit_signal("_on_health_change",health)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
