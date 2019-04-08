extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal _on_reward(rewardee, victim)

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().add_to_group("rewardable")
	self.connect("_on_reward", RewardController, "_on_reward_resolve")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func reward(victim):
	emit_signal("_on_reward",self,victim)
	pass