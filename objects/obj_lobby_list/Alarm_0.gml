steam_lobby_list_add_string_filter("gamemakerSteamworksTemplate", "true", steam_lobby_list_filter_eq);
steam_lobby_list_request();

alarm[0] = 500;