extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var on_floor = false;
var direction = Vector2();
var velocity = Vector2();
var distance = Vector2();
var jump_force = 500;
var speed = 200;
var gravity = 1300;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func _physics_process(delta):
	
	var direction = Vector2()
	
	if Input.is_action_pressed("ui_right"):
		$sprite.flip_h = false
		direction.x = 1
	if Input.is_action_pressed("ui_left"):
		$sprite.flip_h = true
		direction.x = -1	
	if Input.is_action_pressed("ui_up"):
		jump()
		

	distance.x = speed*delta
	velocity.x = (direction.x*distance.x)/delta
	velocity.y += gravity*delta
	
	velocity = move_and_slide(velocity,Vector2(0,-1))
	
	process_collisions()
	
	if is_on_floor() && !on_floor:
		on_floor = true
		print ("Floor")
	

func jump():
#	if is_on_floor():
		velocity.y = -jump_force
		

func process_collisions():
	if(get_slide_count() <= 0):
		return
		
	var collisions = get_slide_collision(get_slide_count()-1)
	
	if(collisions == null):
		return
		
#	print (str(collisions.collider.get_groups()))
		
	if (collisions.collider.is_in_group("collectible")):
		print (str(collisions))
		
		
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if (body.is_in_group("collectible")):
		print (str(body.collect()))
	pass # Replace with function body.
