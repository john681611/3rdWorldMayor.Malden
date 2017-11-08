if (!isServer) exitWith {};
_blacklist = [6405.69,12365.6,0];
_towns=[];
 {
_text =  getText (configfile >> "CfgWorlds" >> "Malden" >> "Names">> (configName _x) >> "type");
_pos = getArray (configfile >> "CfgWorlds" >> "Malden" >> "Names">> (configName _x) >> "position");
_name = getText (configfile >> "CfgWorlds" >> "Malden" >> "Names">> (configName _x) >> "name");
if(!(_pos in _blacklist)) then {
  _towns = _towns + [[_text,_pos,_name]];
}else{
  diag_log "Location Blacklisted";
  diag_log _pos;
};

 } forEach ("getText (_x >> 'type') != 'NameMarine' AND getText (_x >> 'type') != 'CityCenter' AND getText (_x >> 'type') != 'VegetationBroadleaf' AND getText (_x >> 'type') != 'VegetationVineyard' AND getText (_x >> 'type') != 'ViewPoint'" configClasses (configfile >> "CfgWorlds" >> "Malden" >> "Names"));


ztownt = [];
ztowns = [];
ztownm = [];
ztownl = [];
ztownc = [];
ztownTA = [];
ztowna = [];
ztownAll = [];
//Extra areas

_incomeTotal = 0;
_towns = _towns + [["Airport",[8064.88,9743.97,0.00142097],"South Airport"]] + [["NameCity",[6094.51,10757.3,0.00144196],"Ruened Base"]];
{
    _pos = (_x select 1);
    _name  = (_x select 2);
    _m = createMarker [format ["%1", _pos],_pos];
    _mt = createMarker [format ["%1t", _pos],_pos];
    _owner = 0;
    _town = [_m, _mt, _name,  0, _owner];
    switch((_x select 0)) do {
      case "Hill":
      {
        ztownt = ztownt + [_town];
        _m setMarkerSize [100,100];
      };

      case "NameLocal":
      {
        _town set [3,50];
        ztowns = ztowns + [_town];
        _m setMarkerSize [150,150];
      };
      case "NameVillage":
      {
        _town set [3,100];
        ztownm = ztownm + [_town];
        _m setMarkerSize [250,250];
      };
      case "NameCity":
      {
        _town set [3,400];
        ztownl = ztownl + [_town];
         _m setMarkerSize [300,300];
      };

      case "NameCityCapital":
      {
        _town set [3,600];
        ztownc = ztownc + [_town];
        _m setMarkerSize [400,400];
      };
      case "Airport":{
        _town set [3,300];
        ztowna = ztowna + [_town];
        _m setMarkerSize [300,300];
      };
      default {
      };
    };
    _m setMarkerColor "ColorCIV";
    _m setMarkerShape "ELLIPSE";
    _m setMarkerBrush "Solid";
    _m setMarkerAlpha 0.5;

    _mt setMarkerShape "ICON";
    _mt setMarkerType "loc_CivilDefense";

    _incomeTotal = _incomeTotal + (_town select 3);

} forEach _towns;


ztownAll = ztownTA + ztownc + ztownl + ztownm + ztowns + ztownt + ztowna;
ztowninit = 1;
bills = _incomeTotal + 500;

IM = createMarker ["incomeMarker",[200,200]];
IM setMarkerShape "ICON";
IM setMarkerType "Select";

[] call func_update_main_status;
[] call func_update_town_status;
