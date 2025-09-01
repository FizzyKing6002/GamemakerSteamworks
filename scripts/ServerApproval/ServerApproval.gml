/// @self obj_server
function approve_player_ready (_steamID)
{
	return not get_player_ready(_steamID);
}