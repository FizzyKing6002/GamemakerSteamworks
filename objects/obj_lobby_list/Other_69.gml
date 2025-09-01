switch async_load[?"event_type"]
{
	case "lobby_list":
		resetLobbyList();
		
		if steam_lobby_list_get_count() == 0
		{
			lobbyList[0] = instance_create_depth(x, bbox_top + 40, -20, obj_lobby_item);
		}
		else
		{
			for (var _i = 0; _i < steam_lobby_list_get_count(); _i++)
			{
				var _inst = instance_create_depth(x, bbox_top + 40 + 80*_i, -20, obj_lobby_item)
				_inst.lobbyIndex = _i;
				_inst.lobbyID = steam_lobby_list_get_lobby_id(_i);
				_inst.lobbyCreator = steam_lobby_list_get_data(_i, "Creator");
				
				array_push(lobbyList, _inst);
			}
		}
	break;
}