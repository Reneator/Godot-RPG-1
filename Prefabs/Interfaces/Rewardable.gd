extends Node

signal _on_reward(rewardee, victim)

func _ready():
	get_parent().add_to_group("rewardable")
	self.connect("_on_reward", ControllerReward, "_on_reward_resolve")

func reward(victim):
	emit_signal("_on_reward",self,victim)
	pass