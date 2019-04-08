extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().add_to_group("rewardable")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func reward(victim):
	print ("Reward Victim: " + victim.name)
	if(get_parent().is_in_group("hasInventory")):
		print ("Killer has Inventory")
