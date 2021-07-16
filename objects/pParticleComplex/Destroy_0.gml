/// @description Insert description here
// You can write your code in this editor
if (particle)
{
	part_type_destroy(particle);
	part_particles_clear(particle);
	part_emitter_destroy(particle, partEmitter);
	//part_system_destroy(partSystem);
	//part_system_destroy(global.mySystem);
}