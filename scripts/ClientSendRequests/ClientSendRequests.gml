/// @self obj_client
function send_player_sync_request ()
{
	var _b = buffer_create_player_sync_request();
	buffer_relay_client_to_server(_b);
	buffer_delete(_b);
}

/// @self obj_client
function send_player_ready_request ()
{
	var _b = buffer_create_player_ready_request();
	buffer_relay_client_to_server(_b);
	buffer_delete(_b);
}