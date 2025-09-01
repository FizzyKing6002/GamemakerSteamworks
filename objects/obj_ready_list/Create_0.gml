readyList = [];

deviceHandler = undefined;
if instance_exists(obj_server) then deviceHandler = global.server;
else if instance_exists(obj_client) then deviceHandler = global.client;
else show_debug_message("Server or client not initialised...");

readyList[0] = instance_create_depth(x, bbox_top + 40, -20, obj_ready_item);

alarm[0] = 100;

function resetReadyList ()
{
	for (var _i = 0; _i < array_length(readyList); _i++)
	{
		instance_destroy(readyList[_i]);
	}
	readyList = [];
}