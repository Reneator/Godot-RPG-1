extends Node

const statisticsDictionary = {
	
}

func _ready():
	pass # Replace with function body.

static func add_value(key: String, value: int):
	if(statisticsDictionary.has(key)):
		statisticsDictionary[key] += value
	else:
		statisticsDictionary[key] = value
		
	print( str(statisticsDictionary))