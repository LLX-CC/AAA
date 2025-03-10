extends Node2D

const SPEED = 60 #设置速度为60
var direction = 1  #设置方向为1
@onready var left: RayCast2D = $left
@onready var right: RayCast2D = $right
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _process(delta: float) -> void:
	position.x += direction * SPEED * delta #方向（正负1表示）乘以 速度 乘以 时间（1秒）
	
	
	if left.is_colliding():
		animated_sprite.flip_h=false
		direction=1
	elif  right.is_colliding():
		direction=-1
		animated_sprite.flip_h=true
