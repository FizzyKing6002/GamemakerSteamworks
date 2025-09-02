/// @self obj_client
function handle_player_sync_accept (_b)
{
	var _b_size = buffer_get_size(_b);
	var _num_players = _b_size div 9;
	playerList = [];
	
	for (var _i = 0; _i < _num_players; _i++)
	{
		_steamID = buffer_read(_b, buffer_u64);
		_steamName = steam_get_user_persona_name_sync(_steamID);
		_readyNum = buffer_read(_b, buffer_u8);
		_readyBool = _readyNum != 0;
		
		array_push(playerList,
		{
			steamID : _steamID,
			steamName : _steamName,
			ready : _readyBool,
		});
	}
	
	lobbyIndex = get_index_by_player_id(steamID);
	
	show_debug_message(playerList);
}

/// @self obj_client
function handle_player_ready_accept (_b)
{
	_readyID = buffer_read(_b, buffer_u64);
	make_player_ready(_readyID);
}