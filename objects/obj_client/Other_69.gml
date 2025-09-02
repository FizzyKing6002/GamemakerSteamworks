switch async_load[?"event_type"]
{
	case "lobby_joined":
		hostID = steam_lobby_get_owner_id();
		send_player_sync_request();
		show_debug_message("Joined lobby.");
	break;
}