extends Node2D


var timer = null
var lastSpawn = null
var duration = 5000

signal _on_spawn
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	print (get_children())
	timer = find_node("Timer")
#	timer.start()
	pass # Replace with function body.

func spawnDiamond():
	var diamond = load("res://Prefabs/Diamond.tscn").instance()
	add_child(diamond)
	global._set_health(global.health -1 )	
	emit_signal("_on_spawn",global.health)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Timer_timeout():
	spawnDiamond()
	pass # Replace with function body.
