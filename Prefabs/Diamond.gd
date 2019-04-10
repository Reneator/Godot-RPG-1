extends RigidBody2D


func _ready():
	$Item.item_stack_id = 1
	$Item.value = 100
	$Item.item_name = "DiamondRed"
	$Item.model = "res://Prefabs/Item/Models/ModelDiamondRed.tscn"
	$Item.stack_max_size = 10
	pass # Replace with function body.
	

func _physics_process(delta):
	pass
