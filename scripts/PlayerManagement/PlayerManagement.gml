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
	var _yInput = _input.downKey - input.upKey;
	var _runKey = _input._runKey;
	var _actionKey = _input._actionKey;
	
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