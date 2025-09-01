/// @self obj_server
function send_player_ready_accept (_steamID)
{
	var _b = buffer_create_lobby_ready_accept(_steamID);
	buffer_bounce_server_to_clients(_b);
	buffer_delete(_b);
}