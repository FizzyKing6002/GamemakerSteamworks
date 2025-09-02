hovered = false;
selected = false;
disabled = false;

textColor = c_white;



localHost = LocalHost.None;
if instance_exists(obj_server) then localHost = LocalHost.Server;
else if instance_exists(obj_client) then localHost = LocalHost.Client;
else show_debug_message("Server or client not initialised...");

text = "Error";
switch localHost
{
	case LocalHost.Server: text = "Start Game"; break;
	case LocalHost.Client: text = "Ready"; break;
}



function select_action ()
{
	switch localHost
	{
		case LocalHost.Server: global.server.localRequests.gameStart = true; break;
		case LocalHost.Client: global.client.localRequests.ready = true; break;
	}
}

function self_get_all_players_ready ()
{
	if localHost != LocalHost.Server then { show_debug_message("Client has no need to call this function..."); return false; }
	with global.server { return get_all_players_ready() }
}