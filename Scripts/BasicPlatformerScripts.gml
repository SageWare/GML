/* Game Options:
    General - 60 Game Frames per Second
*/



//----- PLAYER -----//
    
    //-- oPlayer - "Create" Event --//
        hsp = 0;        // horizontal speed
        vsp = 0;        // vertical speed
        grv = 0.3;      // gravity
        walksp = 4;     // walkspeed

    //-- oPlayer - "Step - Step" Event --//
        //Controls
            key_left = ((keyboard_check(vk_left)) || (keyboard_check(ord("A"))) || (gamepad_button_check(0,gp_padl)) || (-(gamepad_axis_value(0,gp_axislh))));
            key_right = ((keyboard_check(vk_right)) || (keyboard_check(ord("D"))) || (gamepad_button_check(0,gp_padr)) || (gamepad_axis_value(0,gp_axislh)));
            key_jump = ((keyboard_check_pressed(vk_space)) || (gamepad_button_check(0, gp_face1)));
            var move = key_right - key_left;
            hsp = move * walksp;
            vsp = vsp + grv;

        //Jump Collisions & Checker
            if (place_meeting(x,y+1,oWall)) && (key_jump)
            {
                vsp = -7;
            }
        
        
        //Collisions - Horizontal
            if (place_meeting(x+hsp,y,oWall))
            {
                while (!place_meeting(x+sign(hsp),y,oWall))
                {
                    x = x + sign(hsp);
                }
                hsp = 0;
            }
            x = x + hsp;

        //Collisions - Vertical
            if (place_meeting(x,y+vsp,oWall))
            {
                while (!place_meeting(x,y+sign(vsp),oWall))
                {
                    y = y + sign(vsp);
                }
                vsp = 0;
            }
            y = y + vsp;




//----- WALL -----//
