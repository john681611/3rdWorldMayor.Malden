to_Base =
 {
private ["_Location"];
 _Location = _this select 0;
    _unit = player;
    _unit setpos (_Location findEmptyPosition [5,80]);
    _unit setDamage 0;
    _unit setFatigue 0;	
	skipTime 2;
    _unit allowDamage false;
    sleep 5;
    _unit allowDamage true;
 };


 _missionsData  = [
  [getpos boat1 ,to_Base,"Le Port Harbor","To Le Port Harbor","","",1,[getMarkerPos "boat1mkr"]],
  [getpos boat2 ,to_Base,"Military Island Harbor","To Military Island Harbor","","",1,[getMarkerPos "boat2mkr"]],
  [getpos boat3 ,to_Base,"La Riviere Harbor","To La Riviere Harbor","","",1,[getMarkerPos "boat3mkr"]],
  [getpos boat4 ,to_Base,"Moray Harbor","To Moray Harbor","","",1,[getMarkerPos "boat4mkr"]],
  [getpos boat5 ,to_Base,"Lolisse Harbor","To Lolisse Harbor","","",1,[getMarkerPos "boat5mkr"]]
 ];

/*Maybe Later
_RSPPos = [west] call BIS_fnc_getRespawnMarkers;
{
if (_x != "respawn_west" AND  _x != "respawn_vehicle_west" AND _x !="respawn_west_MHQ" AND _x !="respawn_west_MHQ2" AND _x != "respawn_west_Hotel") then {
_pos = getMarkerPos _x;
_Temp =  [[_pos,to_Base,"Camp","To Camp","","",1,[_pos]]];
_missionsData  = _missionsData + _Temp;
};
} foreach _RSPPos;
*/


 disableserialization;

 _parentDisplay = [] call bis_fnc_displayMission;
 _mapCenter     = getPos player;
 _ORBAT         = [];
 _markers   = [];
 _images    = [];
 _overcast  = overcast;
 _isNight   = !((dayTime > 6) && (dayTime < 20));
 _scale     = 0;
 _simul     = true;

      [
    findDisplay 46,
    _mapCenter,
    _missionsData,
    _ORBAT,
    _markers,
    _images,
    _overcast,
    _isNight,
    _scale,
    _simul
 ] call Bis_fnc_strategicMapOpen;