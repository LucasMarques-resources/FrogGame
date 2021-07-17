// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function CleanParticles(part_type, part_system, emitter, part_emitter)
{
	part_type_destroy(part_type);
	if (emitter) part_emitter_destroy(part_system, part_emitter);
	part_particles_clear(part_system);
	part_system_destroy(part_system);
}