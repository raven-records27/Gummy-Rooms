extends CharacterBody2D

func _physics_process(delta):
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * 400
	move_and_slide()
	if Input.is_action_pressed("ui_right"):
		velocity.x += 100
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 100

func _process(delta):
	if Input.is_action_pressed("ui_right"):
		$LeftIdle.visible = false
		$RightIdle.visible = false
		$RightWalk.visible = true
		$RightWalk.play()
	elif Input.is_action_pressed("ui_left"):
		$RightIdle.visible = false
		$LeftIdle.visible = false
		$LeftWalk.visible = true
		$LeftWalk.play()
	else:
		$RightWalk.visible = false
		$LeftWalk.visible = false
		$RightIdle.visible = true
		$RightIdle.play()



var count = 0
func _on_pickup_area_area_entered(area):
	var red = false
	var yel = false
	var gre = false
	var pur = false
	var redposition = $"../RedPanel".get_position
	var yellowposition = $"../YellowPanel".get_position
	var greenposition = $"../GreenPanel".get_position
	var purpleposition = $"../PurplePanel".get_position
	if area.is_in_group("gumdrop2"):
		if(area.is_in_group("red")):
			red = true
			$"../RedGumdrop".visible = false
		if(area.is_in_group("yellow")):
			yel = true
			$"../YellowGumdrop".visible = false
		if(area.is_in_group("green")):
			gre = true
			$"../GreenGumdrop".visible = false
		if(area.is_in_group("purple")):
			pur = true
			$"../PurpleGumdrop".visible = false

	if area.is_in_group("cactus"):
		get_tree().reload_current_scene()

	if area.is_in_group("trampoline1"):	
		$RightIdle.visible = true
		position = Vector2(900, 650)

	if area.is_in_group("trampoline2"):
		position = Vector2(500, 650)

	if area.is_in_group("panel"):
		count += 1
	if count == 4:
		$"../AnimatedSprite2D".visible = true
		$"../AnimatedSprite2D".play()
