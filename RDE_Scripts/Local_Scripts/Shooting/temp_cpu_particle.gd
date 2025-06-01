extends Node2D
class_name TempCPUParticle
## Used to summon temporary particle that deletes itself when done

var cpu_particle_2d : CPUParticles2D

func setup(particles : CPUParticles2D) -> void:
	cpu_particle_2d = particles.duplicate()
	add_child(cpu_particle_2d)
	cpu_particle_2d.one_shot = true
	cpu_particle_2d.emitting = true
	
	await GlobalTime.local_wait(cpu_particle_2d.lifetime)
	queue_free()
