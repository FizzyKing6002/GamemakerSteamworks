/// @self obj_client
function handle_self_ready_request ()
{
	if approve_self_ready()
	{
		send_player_ready_request();
		return;
	}
	show_debug_message("Self was already ready, request ignored.");
}