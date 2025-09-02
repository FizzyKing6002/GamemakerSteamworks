/// @self obj_client
function buffer_create_player_sync_request ()
{
	var _b = buffer_create(1, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.PlayerSyncRequest);
	
	return _b;
}

/// @self obj_server
function buffer_create_player_sync_accept ()
{
	var _b = buffer_create(1 + 9*array_length(playerList), buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.PlayerSyncAccept);
	for (var _i = 0; _i < array_length(playerList); _i++)
	{
		buffer_write(_b, buffer_u64, playerList[_i].steamID);
		buffer_write(_b, buffer_u8, playerList[_i].ready);
	}
	
	return _b;
}

/// @self obj_client
function buffer_create_player_ready_request ()
{
	var _b = buffer_create(1, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.PlayerReadyRequest);
	
	return _b;
}

/// @self obj_server
function buffer_create_player_ready_accept (_steamID)
{
	var _b = buffer_create(9, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.PlayerReadyAccept);
	buffer_write(_b, buffer_u64, _steamID);
	
	return _b;
}

/// @self obj_server
function buffer_create_game_start ()
{
	var _b = buffer_create(1, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.GameStart);
	
	return _b;
}