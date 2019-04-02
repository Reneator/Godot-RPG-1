extends KinematicBody2D

var direction = Vector2();
var velocity = Vector2();
var distance = Vector2();
var jump_force = 500;
var speed = 200;
var gravity = 1300;

var left = false;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func _physics_process(delta):
	
	direction = Vector2()
	
	if Input.is_key_pressed(KEY_SPACE):
		$sprite/AttackArea.activate()
	
	if Input.is_action_pressed("ui_right"):
		if left:
			apply_scale(Vector2(-1, 1))
			left = false
		direction.x = 1
			
	elif Input.is_action_pressed("ui_left"):
		if !left:
			apply_scale(Vector2(-1, 1))	
			left = true	
		direction.x = -1	
	if Input.is_action_pressed("ui_up"):
		if is_on_floor():
			velocity.y = -jump_force



	distance.x = speed*delta
	velocity.x = (direction.x*distance.x)/delta
	velocity.y += gravity*delta
	
	velocity = move_and_slide(velocity,Vector2(0,-1))
	
	process_collisions()

	play_animation()
	

#func jump():

		
		

func process_collisions():
	if(get_slide_count() <= 0):
		return
		
	var collisions = get_slide_collision(get_slide_count()-1)
	
	if(collisions == null):
		return
		
		
#	if (collisions.collider.is_in_group("collectible")):
#		print (str(collisions))
		
		
	
	
	
func play_animation():
#	print ("directionx: "+ str(direction.x))
	if (is_on_floor() && direction.x == 0):
		$sprite.play("Idle")
	if(!is_on_floor()):
		$sprite.play("Jump")
	if(is_on_floor() && direction.x != 0):
		$sprite.play("Move")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if (body.is_in_group("collectible")):
		body.collect()
#		print ("collected: "+ body.name)
		
	pass # Replace with function body.


