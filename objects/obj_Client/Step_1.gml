while (steam_net_packet_receive())
{
	var _senderID = steam_net_packet_get_sender_id();
	if _senderID != hostID then { show_debug_message("Packet received from wrong ID: " + _senderID); continue; }
	
	steam_net_packet_get_data(inbuf);
	buffer_seek(inbuf, buffer_seek_start, 0);
	
	var _packetType = buffer_read(inbuf, buffer_u8);
	switch _packetType
	{
		case PacketType.PlayerSyncAccept:
			handle_player_sync_accept(inbuf);
		break;
		
		case PacketType.PlayerReadyAccept:
			handle_player_ready_accept(inbuf);
		break;
		
		case PacketType.GameStart:
			handle_game_start(inbuf);
		break;
		
		default:
			show_debug_message("Client received unknown packet: " + string(_packetType));
		break;
	}
}