switch async_load[?"event_type"]
{
	case "lobby_chat_update":
		var _fromID = async_load[?"user_id"];
		var _fromName = steam_get_user_persona_name_sync(_fromID);
		
		if async_load[?"change_flags"] & steam_lobby_member_change_entered
		{
			show_debug_message("Player Joined: " + _fromName)
			array_push(playerList,
			{
				steamID : _fromID,
				steamName : _fromName,
				ready : false,
			});
		}
	break;
}