function buffer_create_lobby_ready_request ()
{
	var _b = buffer_create(1, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.PlayerReadyRequest);
	
	return _b;
}

function buffer_create_lobby_ready_accept (_steamID)
{
	var _b = buffer_create(9, buffer_fixed, 1);
	
	buffer_write(_b, buffer_u8, PacketType.PlayerReadyAccept);
	buffer_write(_b, buffer_u64, _steamID);
	
	return _b;
}