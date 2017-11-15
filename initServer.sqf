ztowninit = 0;
func_update_main_status = compile preprocessfilelinenumbers "Server\functions\func_update_main_status.sqf";
func_update_town_status = compile preprocessfilelinenumbers "Server\functions\func_update_town_status.sqf";
func_get_town = compile preprocessfilelinenumbers "Server\functions\func_get_town.sqf";
func_set_town_owner = compile preprocessfilelinenumbers "Server\functions\func_set_town_owner.sqf";
func_skip_time = compile preprocessfilelinenumbers "Server\functions\func_skip_time.sqf";
func_boat_teleport = compile preprocessfilelinenumbers "Server\functions\func_boat_teleport.sqf";
[] execVM "Server\z_townmgr.sqf";
waitUntil {ztowninit==1};
setTimeMultiplier 12;
 //Fog limiter
 while {true} do
 {
	if(fog > 0.5) then {
		120 setFog 0;
	};
	sleep 1800;
 };
