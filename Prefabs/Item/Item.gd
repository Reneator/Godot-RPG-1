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

func get_effects_for_category(category):
	var _effects = []
	for effect in effects:
		if (effect.stat_name == category):
			_effects.append(effect)
	return _effects;