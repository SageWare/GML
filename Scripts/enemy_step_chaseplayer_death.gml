//Enemy - Step Event
//Pathing to player, instance destroyed at 0 hp, adds points to thescore, particle effects
//author Sage Fremont

if (instance_exists(obj_player)) 
{
	move_towards_point(obj_player.x,obj_player.y,spd);
}

image_angle = direction;

if (hp <= 0) 
{
	with (obj_score) thescore = thescore + 75;
	audio_sound_pitch(snd_death,random_range(0.8,1.2));
	audio_play_sound(snd_death,0,0);
	instance_destroy();
	repeat(15)
	{
		effect_create_above(ef_cloud, x, y, choose(0, 1, 2), make_colour_hsv(random(255), 255, 255));
		effect_create_above(ef_firework, x, y, choose(0, 1, 2), make_colour_hsv(random(255), 255, 255));
	}
}