extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var timer = null
var attacking = false
var attack_delay = false

# Called when the node enters the scene tree for the first time.
func _ready():
	timer = Timer.new()
	timer.wait_time = 1
	timer.one_shot = true
	timer.process_mode = Timer.TIMER_PROCESS_PHYSICS
	timer.connect("timeout", self, "stop_attack")
	add_child(timer)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func activate():
	if(!attacking):
		print("attacking")
		attacking = true
		
		if (attack_delay):
			timer.start(1)
		else:
			attacking = false

		var bodies = get_overlapping_bodies()
		for body in bodies:
			attack(body)

		
	

func _on_AttackArea_body_entered(body):
	if(attacking):
		attack(body)
#	pass # Replace with function body.

func attack(body):
	if(body.is_in_group("hittable")):
		print("attacking: "+ body.name)		
#		body.hit()
		body.get_node("Hitable").hit(self)
		


func stop_attack():
	attacking = false
	pass # Replace with function body.
