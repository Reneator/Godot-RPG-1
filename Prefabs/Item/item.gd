extends Game_Object
class_name Item


var value
var item_name
var item_stack_id
var model
var collectible: bool
var stack_max_size

#Effects
var effects = []


func _ready():
	get_parent().add_to_group("Item")