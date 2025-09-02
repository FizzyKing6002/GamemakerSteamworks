/// @self obj_device_handler
function get_index_by_player_id (_steamID)
{
	for (var _i = 0; _i < array_length(playerList); _i++)
	{
		if playerList[_i].steamID == _steamID then return _i;
	}
	return noone;
}

/// @self obj_device_handler
function get_player_ready (_steamID)
{
	var _index = get_index_by_player_id(_steamID);
	return playerList[_index].ready
}

/// @self obj_device_handler
function get_all_players_ready ()
{
	for (var _i = 0; _i < array_length(playerList); _i++)
	{
		if not playerList[_i].ready then return false;
	}
	return true;
}

/// @self obj_device_handler
function make_player_ready (_steamID)
{
	var _index = get_index_by_player_id(_steamID);
	
	if _index == noone then { show_debug_message("Ready player not found."); return; }
	playerList[_index].ready = true;
}