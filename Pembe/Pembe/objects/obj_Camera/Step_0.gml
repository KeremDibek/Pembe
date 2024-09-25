//Fullscreen Toggle
if keyboard_check_pressed(vk_f8)
{
	window_set_fullscreen(!window_get_fullscreen());
}
//Exit if there is no Player
if !instance_exists(obj_Player) 
{
	exit;
}

//Get Camera Size

var _camWidth = camera_get_view_width(view_camera[0]);

var _camHeight = camera_get_view_height(view_camera[0]); 

//Get Camera Coordinates
var _camX = obj_Player.x - _camWidth/2;
var _camY = obj_Player.y - _camHeight/2;

//Constrain Cam to Room Borders
_camX = clamp(_camX, 0, room_width - _camWidth);
_camY = clamp(_camY, 0, room_height - _camHeight);

//Set Cam Coord Variables
finalCamX += (_camX - finalCamX) * camTrailSpd;
finalCamY += (_camY - finalCamY) * camTrailSpd;
//Set camera Coordinates
camera_set_view_pos(view_camera[0], finalCamX, finalCamY);