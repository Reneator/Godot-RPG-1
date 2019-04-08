extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$Item.item_stack_id = 1
	$Item.value = 100
	$Item.item_name = "DiamondRed"
	$Item.model = "res://Prefabs/Item/Models/ModelDiamondRed.tscn"
	$Item.stack_max_size = 10
	pass # Replace with function body.
	

func _physics_process(delta):
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass