extends state

func _physics_process(delta):
	if !player.is_on_wall():
		state_machine.change_to_state("Jump")
	if Input.is_action_just_pressed("jump"):
		state_machine.change_to_state("Jump")
	if player.is_on_floor():
		state_machine.change_to_state("Idle")
	
	
	player.flip_h(player.get_wall_normal().x == 1)
	player.velocity.y = clamp(player.velocity.y, -INF, player.max_wallslide_speed)
	
	if player.dir:
		player.flip_h(player.dir.x != 1)
	player.velocity.x += player.aerial_speed * player.dir.x * delta



func on_state_entered():
	player.change_animation("wall_slide")