// only spawn this object if player is not host

hovered = false;
selected = false;
disabled = false;

textColor = c_white;
text = "Ready";

function selectAction ()
{
	if not instance_exists(obj_client) then return;
	global.client.localRequests.ready = true;
}