extends CanvasLayer

const DEATH_PARTICLES = preload("res://Materials/death_particles.tres")
const LEVEL_COMPLETION_PARTICLES = preload("res://Materials/level_completion_particles.tres")

var materials = [
	DEATH_PARTICLES,
	LEVEL_COMPLETION_PARTICLES,
]

var frames = 0
var loaded = false

func _ready():
	for material in materials:
		var particles_instance = GPUParticles3D.new()
		particles_instance.set_process_material(material)
		particles_instance.set_one_shot(true)
		particles_instance.set_emitting(true)
		self.add_child(particles_instance)

func _physics_process(_delta):
	if frames >= 3:
		set_physics_process(false)
		loaded = true
	frames += 1
