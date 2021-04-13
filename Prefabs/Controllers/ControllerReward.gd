extends Node


func _on_reward_resolve(rewardee, victim):
	print ("ControllerReward: " + rewardee.name + " got rewarded by " + victim.name)
	
#	print ("Reward Victim: " + victim.name)
	if(rewardee.get_parent().is_in_group("hasInventory")):
		print ("Killer has Inventory")
		var items = victim.get_parent().get_node("LootTable").items
		print ("Items in Loottable: " + str(items))
		rewardee.get_parent().get_node("Inventory").add_items(items)
	if(rewardee.get_parent().is_in_group("hasStats")):
		print ("Rewardee has Stats")
	if(rewardee.get_parent().is_in_group("hasLevel")):
		print ("Rewardee has Level")
		
		
#	player.herolevel.reward(victim.LootTable)
