// only spawn this object if player is not host

hovered = false;
selected = false;
disabled = false;

textColor = c_white;
text = "Ready";

function selectAction ()
{
	var _b = buffer_create_lobby_ready_request();
	buffer_relay_client_to_server(_b);
	buffer_delete(_b);
}