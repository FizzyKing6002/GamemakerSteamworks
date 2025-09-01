hovered = false;
selected = false;
disabled = false;

textColor = c_white;

deviceType = DeviceType.None;
if instance_exists(obj_server) then deviceType = DeviceType.Server;
else if instance_exists(obj_client) then deviceType = DeviceType.Client;
else show_debug_message("Server or client not initialised...");

text = "Error";
if deviceType == DeviceType.Server then text = "Start Game";
else if deviceType == DeviceType.Client then text = "Ready";

function select_action ()
{
	show_debug_message("Clicked!")
	if deviceType == DeviceType.Server then show_debug_message("Starting Game...");
	else if deviceType == DeviceType.Client then global.client.localRequests.ready = true;
}

function self_get_all_players_ready ()
{
	with global.server { return get_all_players_ready() }
}