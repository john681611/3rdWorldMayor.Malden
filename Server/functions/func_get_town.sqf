//Providing a marker zone get town
private["_mkr", "_town"];
_mkr = _this;
_town = [];
{
	if(_mkr == (_x select 0)) then {
		_town = _x;
	}
}forEach ztownAll;
_town