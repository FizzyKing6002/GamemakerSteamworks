hovered = false;
selected = false;
disabled = false;

textColor = c_white;
text = "Join Lobby";

function selectAction ()
{
	// Disable other buttons
	for (var _i = 0; _i < 5; _i++)
	{
		var _inst = instance_find(obj_menu_button, _i);
		if _inst != noone then _inst.disabled = true;
	}
	
	var lobby_list = instance_create_depth(416, 208, -10, obj_lobby_list);
}