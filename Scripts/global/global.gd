extends Node

var health = 4
signal _on_health_change;


func _ready():
	pass # Replace with function body.


func _set_health(new_health):
	health = new_health
	emit_signal("_on_health_change",health)

