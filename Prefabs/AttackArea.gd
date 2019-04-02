extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var timer = null
var attacking = false

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
	print (str(timer.time_left))
	if(!attacking):
		print("attacking")
		timer.start(1)
		attacking = true
		var bodies = get_overlapping_bodies()
		for body in bodies:
			_on_AttackArea_body_entered(body)

		
	

func _on_AttackArea_body_entered(body):
	if(attacking):
		print ("Entered :" + body.name)
		if(body.is_in_group("enemy")):
			if(body.has_method("hit")):
				body.hit()
	pass # Replace with function body.


func stop_attack():
	attacking = false
	pass # Replace with function body.
