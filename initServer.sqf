ztowninit = 0;
[] execVM "Server\z_townmgr.sqf";
waitUntil {ztowninit==1};
 //Fog limiter
 while {true} do
 {
	if(fog > 0.5) then {
		120 setFog 0;
	};
	sleep 1800;
 };
