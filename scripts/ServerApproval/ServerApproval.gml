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