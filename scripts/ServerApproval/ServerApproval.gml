/// @self obj_server
function approve_player_sync (_steamID)
{
	return true;
}

/// @self obj_server
function approve_player_ready (_steamID)
{
	return not get_player_ready(_steamID);
}

/// @self obj_server
function approve_self_game_start ()
{
	return get_all_players_ready();
}