extends Game_Object
class_name Item


var value
var item_name
var item_stack_id
var model
var collectible: bool
var stack_max_size
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().add_to_group("Item")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
