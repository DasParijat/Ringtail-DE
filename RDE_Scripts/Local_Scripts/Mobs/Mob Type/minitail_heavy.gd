extends Node2D
# Minitail HEAVY

@export var mob_res : MobRes
@export var base : BaseMob 
@export var controller : MobController

## Bullet related variables
var projectile : ShootAttack
var _bullet_load = preload("res://RDE_Scenes/Shooting/bullet.tscn")
var _bullet_res : BulletRes = preload("res://RDE_Resources/Bullet Res/MinitailHEAVY_Projectile.tres")

func _ready() -> void:
	controller.action_handling(1)
	projectile = ShootAttack.new(base, _bullet_load, _bullet_res, get_parent().get_parent())
	
func _process(_delta : float) -> void:
	controller.action_handling(1)


func action1() -> void:
	## Dash near to player then go to random pos
	base.action("move_torward_point", {"target": base.get_rand_player_pos(25, 75, 25, 75), "delay": 0.3, "speed": 150, "length": 1})
	await GlobalTime.local_wait(1)
		
	for i in range(2): 
		base.action("move_torward_point", {"target": base.get_rand_player_pos(400, 600, 400, 600), "delay": 0, "speed": 150, "length": 0.8})
		await GlobalTime.local_wait(0.8)
	
	base.action("observe_player", 0.2)
	projectile.shoot()
	#print("shot projectile from heavy")
	controller.hold(false)

func _exit_tree() -> void:
	GlobalSignal.emit_signal("update_power", 2)
