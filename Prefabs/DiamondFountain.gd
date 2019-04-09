extends Node2D


var timer = null
var lastSpawn = null
var duration = 5000

signal _on_spawn (hp)


func _ready():
	print (get_children())
	var timer = Timer.new()
	timer.wait_time = 1
	timer.connect("timeout",self,"_on_Timer_timeout")


func spawnDiamond():
	var diamond = load("res://Prefabs/Diamond.tscn").instance()
	add_child(diamond)
	global._set_health(global.health -1 )	
	emit_signal("_on_spawn",global.health)


func _on_Timer_timeout():
	spawnDiamond()
