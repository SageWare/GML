//PLAYER MOVEMENT AND COLLISIONS 01
//author Sage Fremont

///Player input
key_right = keyboard_check(vk_right);
key_left = -keyboard_check(vk_left);
key_jump = keyboard_check_pressed(vk_space);

//Input events
move = key_left + key_right;
hsp = move * movespeed;
if (vsp < 10) vsp += grav;

//Gravity
if (place_meeting(x,y+1,obj_ground))
{
    vsp = key_jump * -jumpspeed
}

//Horizontal Collision
if (place_meeting(x+hsp,y,obj_ground))
{
    while(!place_meeting(x+sign(hsp),y,obj_ground))
        {
            x += sign(hsp);
        }
        hsp = 0;
}
x += hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,obj_ground))
{
    while(!place_meeting(x,y+sign(vsp),obj_ground))
        {
            y += sign(vsp);
        }
        vsp = 0;
}
y += vsp;