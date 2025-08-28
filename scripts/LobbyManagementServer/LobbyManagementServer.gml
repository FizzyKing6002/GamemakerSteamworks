/// @self obj_Server
function send_player_sync (_steamID)
{
    var _b = buffer_create(1, buffer_grow, 1);
    buffer_write(_b, buffer_u8, NETWORK_PACKETS.SYNC_PLAYERS);
    buffer_write(_b, buffer_string, shrink_player_list())
    
    steam_net_packet_send(_steamID, _b);
    buffer_delete(_b);
}

/// @self obj_Server
function send_player_spawn (_steamID, _slot)
{
    var _pos = grab_spawn_point(_slot);
    var _b = buffer_create(5, buffer_fixed, 1);
    
    buffer_write(_b, buffer_u8, NETWORK_PACKETS.SPAWN_SELF);
    buffer_write(_b, buffer_u16, _pos.x);
    buffer_write(_b, buffer_u16, _pos.y);
    
    steam_net_packet_send(_steamID, _b);
    buffer_delete(_b);
    
    server_player_spawn_at_pos(_steamID, _pos);
    send_other_player_spawn(_steamID, _pos);
}

/// @self obj_Server
function send_other_player_spawn (_steamID, _pos)
{
    var _b = buffer_create(13, buffer_fixed, 1);
    
    buffer_write(_b, buffer_u8, NETWORK_PACKETS.SPAWN_OTHER);
    buffer_write(_b, buffer_u16, _pos.x);
    buffer_write(_b, buffer_u16, _pos.y);
    buffer_write(_b, buffer_u64, _steamID);
    
    for (var _i = 0; _i < array_length(playerList); _i++)
    {
        _playerID = playerList[_i].steamID;
        
        if _playerID != steamID && _playerID != _steamID
        {
            steam_net_packet_send(_playerID, _b);
        }
    }
    
    buffer_delete(_b);
}

/// @self obj_Server
function shrink_player_list ()
{
    //var _shrunkList = playerList;
    //
    //for (var _i = 0; _i < array_length(_shrunkList); _i++)
    //{
        //_shrunkList[_i].character = undefined;
    //}
    //return json_stringify(_shrunkList);
	return json_stringify(playerList);
}

/// @self obj_Server
function server_player_spawn_at_pos (_steamID, _pos)
{
    var _layer = layer_get_id("instances");
    
    for (var _i = 0; _i < array_length(playerList); _i++)
    {
        if playerList[_i].steamID == _steamID
        {
            var _inst = instance_create_layer(_pos.x, _pos.y, _layer, obj_Player,
            {
                steamID : _steamID,
                steamName : playerList[_i].steamName,
                lobbyMemberID : _i,
            });
            
            playerList[_i].character = _inst;
        }
    }
}

/// @self obj_Server
function send_player_input_to_clients (_playerInput)
{
	if _playerInput == undefined then return;
	
	var _b = buffer_create(13, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, NETWORK_PACKETS.SERVER_PLAYER_INPUT);
	buffer_write(_b, buffer_u64, _playerInput.steamID);
	buffer_write(_b, buffer_s8, _playerInput.xInput);
	buffer_write(_b, buffer_s8, _playerInput.yInput);
	buffer_write(_b, buffer_u8, _playerInput.runKey);
	buffer_write(_b, buffer_u8, _playerInput.actionKey);
	
	for (var _i = 0; _i < array_length(obj_Server.playerList); _i++)
	{
		_playerID = obj_Server.playerList[_i].steamID;
		if (_playerID != obj_Server.steamID)
		{
			steam_net_packet_send(_playerID, _b);
		}
	}
	buffer_delete(_b)
}