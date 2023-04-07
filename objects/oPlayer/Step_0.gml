
right_key = keyboard_check(ord("D")) || keyboard_check(vk_right);
left_key = keyboard_check(ord("A")) || keyboard_check(vk_left);
up_key = keyboard_check(ord("W")) || keyboard_check(vk_up);
down_key = keyboard_check(ord("S")) || keyboard_check(vk_down);
sprint_key = keyboard_check(vk_shift)
shoot_button = mouse_check_button(mb_left)
shot_delay = max(0, shot_delay - 1);
xspd = (right_key-left_key) * movesp;
yspd = (down_key-up_key) * movesp;
wDamage = currentWeapon.damage
wSpeed = currentWeapon.bSpeed

if plife == 0
	{
	room_goto(Room2)
	}
//schieten

if (shoot_button && shot_delay == 0 && xspd == 0 && yspd == 0)
{
    // set the delay to a value that works for your game (60 would be one second)
    shot_delay = 30;
    
    var bullet_spd = wSpeed;
    var bullet_dir = point_direction(oPlayer.x, oPlayer.y, mouse_x, mouse_y);
    var bullet_x = oPlayer.x;
    var bullet_y = oPlayer.y-8;
    
    var new_bullet = instance_create_layer(bullet_x, bullet_y, "Instances", currentWeapon.Bullet);
    new_bullet.xspeed = lengthdir_x(bullet_spd, bullet_dir);
    new_bullet.yspeed = lengthdir_y(bullet_spd, bullet_dir);
    new_bullet.image_angle = bullet_dir; // set the sprite's angle to the direction of movement
    new_bullet.scale = 1; // set the scale back to 1 if it was changed before
	shooting = 20
}
// sprinten is wel grappig 
if sprint_key == 1
{
    movesp = 1.5
}
else
{
    movesp = 1
}

// lopenanimatie
face = IDLE

if xspd < 0 or yspd < 0 && xspd != 1
 	{
		face = LEFT
	}
else if xspd > 0 or yspd > 0 && xspd != -1
	{
		face = RIGHT
	}

//place meeting shit ook leuk :)))))
if place_meeting(x + xspd, y, oWall)
{
    while (!place_meeting(x + sign(xspd), y, oWall))
    {
        x += sign(xspd);
    }
    xspd = 0;
}
if place_meeting(x, y + yspd, oWall)
{
    while (!place_meeting(x, y + sign(yspd), oWall))
    {
        y += sign(yspd);
    }
    yspd = 0;    
}


// beweging
x += xspd
y += yspd

if shooting > 0
	{
		face = SHOOT
		shooting -=1
	}
//animatie
sprite_index = sprite[face]


// camera
var cam_x = lerp(camera_get_view_x(view_camera[0]), (x) - view_wview[0]/2, 0.1);
var cam_y = lerp(camera_get_view_y(view_camera[0]), (y) - view_hview[0]/2, 0.1);

camera_set_view_pos(view_camera[0], cam_x, cam_y);
