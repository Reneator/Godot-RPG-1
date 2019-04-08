extends KinematicBody2D

var direction = Vector2();
var velocity = Vector2();
var distance = Vector2();
var jump_force = 500;
var speed = 200;
var gravity = 1300;

var attacking = false;

var left = false;

var Item = load("res://Prefabs/Item/Item.gd")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	

func _physics_process(delta):
	
	direction = Vector2()
	

	
	if Input.is_action_pressed("ui_right"):
		if left:
			$sprite.apply_scale(Vector2(-1, 1))
			left = false
		direction.x = 1
			
	elif Input.is_action_pressed("ui_left"):
		if !left:
			$sprite.apply_scale(Vector2(-1, 1))	
			left = true	
		direction.x = -1	
	if Input.is_action_pressed("ui_up"):
		if is_on_floor():
			velocity.y = -jump_force

	var _gravity 
	if(velocity.y < 0 && Input.is_action_pressed("ui_up")):
		_gravity = 500
	else:
		_gravity = gravity


	distance.x = speed*delta
	velocity.x = (direction.x*distance.x)/delta
	velocity.y += _gravity*delta
	
	velocity = move_and_slide(velocity,Vector2(0,-1))
	
	process_collisions()

	play_animation()
	

func _input(event):
		if event.is_action_pressed("ui_attack") && not event.is_echo():
			spawn_Diamond()
			$sprite/AttackArea.activate()
			$sprite.play("Attack")
			attacking = true
			yield(get_tree().create_timer(1.0), "timeout")
#			print ("attacking stop")
			attacking = false
			
		if event.is_action_pressed("ui_inventory") && not event.is_echo():
			print(str(get_groups()))
			openInventory()
			
		if event.is_action_pressed("ui_inventory_eject") && not event.is_echo():
			dropItem()
			
		if event.is_action_pressed("ui_restart") && not event.is_echo():
			get_tree().reload_current_scene()
	
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
	if(attacking):
		$sprite.play("Attack")
		return
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
	if (body.is_in_group("collectable")):
		if(body.is_in_group("Item")):
			var added = $Inventory.add_item(body.get_node("Item"))
			if (added):
				body.get_node("Collectable").collect()
#		print ("collected: "+ body.name)
		
	pass # Replace with function body.


func spawn_Diamond():
	var item = Item.new()
	item.value = 100
	item.item_name = "DiamondGreen"
	item.model = "res://Prefabs/Item/Models/ModelDiamondGreen.tscn"
	item.stack_max_size = 10
	item.item_stack_id = 2
	var itemGenerator = load("res://Prefabs/Item/ItemGenerator.gd").new()
	var itemNode = itemGenerator.generateItemNode(item)
	get_parent().get_node("DiamondFountain").call_deferred("add_child",itemNode)
#	get_tree().current_scene().get_node("DiamondFountain").add_child(itemNode)
	

func openInventory():
	$Inventory.print_item_slots()
	
func dropItem():
	var itemNode = $Inventory.return_and_remove_last_item_node()
	if (itemNode == null):
		return
	itemNode.global_position = $sprite/ItemSpawnPoint.global_position
	get_parent().get_parent().add_child(itemNode)
#	var vector = itemNode.global_position - $sprite/ItemSpawnPoint.global_position
#	itemNode.linear_velocity.x = vector.x*2000
#	itemNode.linear_velocity.y = vector.y*2000
