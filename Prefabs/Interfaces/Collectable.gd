extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().add_to_group("collectable")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func collect():
	global._set_health(global.health + 1)
	get_parent().get_parent().remove_child(self.get_parent())