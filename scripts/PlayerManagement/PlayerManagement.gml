function grab_spawn_point (_player)
{
    var _spawnPoint = instance_find(obj_SpawnPoint, _player);
    
    if _spawnPoint == noone then return {x : 0, y : 0};
    return {x : _spawnPoint.x, y : _spawnPoint.y}
}

/// @self obj_Client
function send_player_input (_input, _lobby_host)
{
	var _xInput = _input.rightKey - _input.leftKey;
	var _yInput = _input.downKey - _input.upKey;
	var _runKey = _input.runKey;
	var _actionKey = _input.actionKey;
	
	var _b = buffer_create(5, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, NETWORK_PACKETS.CLIENT_PLAYER_INPUT);
	buffer_write(_b, buffer_s8, _xInput);
	buffer_write(_b, buffer_s8, _yInput);
	buffer_write(_b, buffer_u8, _runKey);
	buffer_write(_b, buffer_u8, _actionKey);
	
	steam_net_packet_send(_lobby_host, _b);
	
	buffer_delete(_b);
}

function receive_player_input (_b, _steamID = -1)
{
	if _steamID == -1 then _steamID = buffer_read(_b, buffer_u64);
	
	var _xInput = buffer_read(_b, buffer_s8);
	var _yInput = buffer_read(_b, buffer_s8);
	var _runKey = buffer_read(_b, buffer_u8);
	var _actionKey = buffer_read(_b, buffer_u8);
	
	var _player = find_player_by_steam_id(_steamID)
	
	if _player == noone then return;
	_player.xInput = _xInput
	_player.yInput = _yInput
	_player.runKey = _runKey
	_player.actionKey = _actionKey
	
	return
	{
		steamID : _steamID,
		xInput : _xInput,
		yInput : _yInput,
		runKey : _runKey,
		actionKey : _actionKey,
	}
}

/// @self obj_Server
function find_player_by_steam_id (_steamID)
{
	for (var _i = 0; _i < array_length(playerList); _i++)
	{
		var _player = playerList[_i].character;
		
		if _player == undefined then continue;
		if _player.steamID == _steamID return _player;
	}
	return noone;
}

/// @self obj_Server
function send_player_positions ()
{
	for (var _i = 0; _i < array_length(playerList); _i++)
	{
		var _player = playerList[_i];
		
		if _player.character == undefined then continue;
		if _player.steamID == undefined then continue;
		
		var _b = buffer_create(13, buffer_fixed, 1);
		
		buffer_write(_b, buffer_u8, NETWORK_PACKETS.PLAYER_POSITION);
		buffer_write(_b, buffer_u64, _player.steamID);
		buffer_write(_b, buffer_u16, _player.character.x);
		buffer_write(_b, buffer_u16, _player.character.y);
		
		for (var _k = 0; _k < array_length(playerList); _k++)
		{
			_playerID = playerList[_k].steamID;
			
			if _playerID == obj_Server.steamID then continue;
			steam_net_packet_send(_playerID, _b);
		}
		buffer_delete(_b);
	}
}

/// @self obj_Client
function update_player_position (_b)
{
	var _steamID = buffer_read(_b, buffer_u64);
	var _x = buffer_read(_b, buffer_u16);
	var _y = buffer_read(_b, buffer_u16);
	
	for (var _i = 0; _i < array_length(playerList); _i++)
	{
		if _steamID == playerList[_i].steamID
		{
			if playerList[_i].character == undefined then continue;
			
			playerList[_i].character.x = _x
			playerList[_i].character.y = _y
		}
	}
}