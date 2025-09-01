/// @self obj_server
function handle_player_ready_request (_senderID, _b)
{
	if approve_player_ready(_senderID)
	{
		send_player_ready_accept(_senderID);
		make_player_ready(_senderID);
		return;
	}
	show_debug_message("Player was already ready, request ignored.");
}