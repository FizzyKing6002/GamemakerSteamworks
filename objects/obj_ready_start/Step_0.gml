if localHost == LocalHost.None
{
	image_index = 3;
	exit;
}
if localHost == LocalHost.Server and not self_get_all_players_ready()
{
	image_index = 3;
	exit;
}
if localHost == LocalHost.Client and global.client.playerList[global.client.lobbyIndex].ready
{
	image_index = 3;
	exit;
}
if (point_in_rectangle(mouse_x, mouse_y, bbox_left, bbox_top, bbox_right, bbox_bottom) or selected == true)
{
	if (mouse_check_button(mb_left))
	{
		image_index = 2;
		if mouse_check_button_pressed(mb_left) then select_action();
		exit;
	}
	image_index = 1;
	exit;
}
image_index = 0;