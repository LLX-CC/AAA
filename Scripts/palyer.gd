extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity += get_gravity() * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		animated_sprite.play("jump")
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("left", "right")#绑定自定义的动作

	if direction<0:
		animated_sprite.flip_h=true
	elif direction>0:
		animated_sprite.flip_h=false
	if is_on_floor():
		if not animated_sprite.is_playing() or animated_sprite.animation != "jump":
			if direction==0:
				animated_sprite.play("IDLE")
			else :
				animated_sprite.play("run")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
