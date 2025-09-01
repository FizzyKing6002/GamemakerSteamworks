function send_player_ready_request ()
{
	var _b = buffer_create_lobby_ready_request();
	buffer_relay_client_to_server(_b);
	buffer_delete(_b);
	show_debug_message("Sent client ready request...")
}