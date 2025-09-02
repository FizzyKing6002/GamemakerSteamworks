/// @self obj_server
function handle_self_game_start_request ()
{
	if approve_self_game_start()
	{
		send_game_start();
		room_goto(rm_game);
		return;
	}
	show_debug_message("Game start denied.");
}