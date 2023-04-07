/// @description Insert description here
// You can write your code in this editor

if current_health <= 0 
	{
		dying = true
		movesp = 0
		dyingcount -= 1
	}
if  dyingcount <= 0 && dying = true
	{
		instance_destroy()
		dying = false
	}

var target_obj = instance_nearest(x, y, oPlayer);
	
var dist = distance_to_object(target_obj); 

//schieten

if (instance_exists(oPlayer)){
	if reload_time <= 0
	{
		
		var dir_to_player = point_direction(x, y, oPlayer.x, oPlayer.y);
        
		var bullet = instance_create_layer(x-9, y-9, "Instances", Red_Bullet_Big);
        bullet.direction = dir_to_player;
        bullet.speed = 3;
		var bullet2 = instance_create_layer(x-9, y-9, "Instances", Red_Bullet_Big);
		bullet2.direction = point_direction(x-9, y-9, target_obj.x + 50, target_obj.y - 50);
		bullet2.speed = 3;
		var bullet3 = instance_create_layer(x-9, y-9, "Instances", Red_Bullet_Big);
		bullet3.direction = point_direction(x-9, y-9, target_obj.x - 50, target_obj.y + 50);
		bullet3.speed = 3;
		var bullet4 = instance_create_layer(x-9, y-9, "Instances", Red_Bullet_Big);
		bullet4.direction = point_direction(x-9, y-9, target_obj.x + 100, target_obj.y - 50);
		bullet4.speed = 3;
		var bullet5 = instance_create_layer(x-9, y-9, "Instances", Red_Bullet_Big);
		bullet5.direction = point_direction(x-9, y-9, target_obj.x - 100, target_obj.y + 50);
		bullet5.speed = 3;
		reload_time	= 120;
		shooting = 40
		
    }
	else
	{
		reload_time -= 1
		shooting -= 1
	}
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
//loop naar makker toe
var dir = point_direction(x, y, target_obj.x, target_obj.y); 

var aspeed = 0.3 

var spd_x = lengthdir_x(aspeed, dir); 
var spd_y = lengthdir_y(aspeed, dir); 

aspeed = point_distance(x, y, target_obj.x, target_obj.y) / dist * aspeed;

//animation en loop shit weer ja leuk

if (dist > 40 && dist < 120) 
{
	if spd_x < 0
 	{
		face = LEFT
	}
	else if spd_x > 0
	{
		face = RIGHT
	}
    x += spd_x * movesp;
    y += spd_y * movesp;
}




//belangrijk!!!?
if dying = false && shooting <= 0
{
	sprite_index = sprite[face]
}
else if dying = false && shooting > 0
{
if spd_x < 0
 	{
		sprite_index = sprite[SHOOTLEFT]
	}
	else if spd_x > 0
	{
		sprite_index = sprite[SHOOTRIGHT]
	}
}
else if dying = true
{
	sprite_index = sprite[DEATH]
}