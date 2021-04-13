extends Game_Object
class_name Item

var id
var value
var item_name
var icon
var model
var collectible: bool
var stack_max_size
var sprite: String

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
