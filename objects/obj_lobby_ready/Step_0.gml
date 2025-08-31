if instance_exists(global.client) and global.client.playerList[global.client.lobbyIndex].ready
{
	image_index = 3;
}
else if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) or selected == true)
{
	if (mouse_check_button(mb_left))
	{
		image_index = 2;
		if mouse_check_button_pressed(mb_left) then selectAction();
	}
	else
	{
		image_index = 1;
	}
}
else
{
	image_index = 0;
}