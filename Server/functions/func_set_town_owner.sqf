private["_po_ms","_owner"];
//_town = [zonemkr, textmkr, name,  income, owner];

_m = (_this select 0);
_owner = (_this select 1);

_town = _m call func_get_town;
_index = ztownAll find _town;

_town set [4,_owner];

switch (_owner) do {
		case 0: {
			_town set [3,(_town select 3)*0.5];
		 };
		 case 1: {
			_town set [3,(_town select 3)*2];
		 };
		 case 2: {
			_town set [3,(_town select 3)*3];
		 };
		default { };
	};

ztownAll set [_index,_town];

[] call func_update_town_status;