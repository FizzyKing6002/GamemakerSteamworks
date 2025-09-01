while (steam_net_packet_receive())
{
	var _senderID = steam_net_packet_get_sender_id();
	
	steam_net_packet_get_data(inbuf);
	buffer_seek(inbuf, buffer_seek_start, 0);
	
	var _packetType = buffer_read(inbuf, buffer_u8);
	switch _packetType
	{
		case PacketType.PlayerReadyRequest:
			handle_player_ready_request(_senderID, inbuf);
		break;
		
		default:
			show_debug_message("Server received unknown packet: " + string(_packetType));
		break;
	}
}