if deviceHandler == undefined then exit;

resetReadyList();

for (var _i = 0; _i < array_length(deviceHandler.playerList); _i++)
{
	var _inst = instance_create_depth(x, bbox_top + 40 + 80*_i, -20, obj_ready_item);
	_inst.readyIndex = _i;
	_inst.readyBool = deviceHandler.playerList[_i].ready;
	if deviceHandler.playerList[_i].steamID == deviceHandler.steamID then _inst.playerName = "You";
	else _inst.playerName = deviceHandler.playerList[_i].steamName;
	
	array_push(readyList, _inst);
}

alarm[0] = 100;