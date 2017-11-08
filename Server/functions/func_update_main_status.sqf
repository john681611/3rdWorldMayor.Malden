private ["_incomeTotal"];
_incomeTotal = 0;
//income
{
	_incomeTotal = _incomeTotal + (_x select 3);
} forEach ztownAll;
IM setMarkerText format["$%1 -  $%2 = $%3",bills,_incomeTotal, (bills-_incomeTotal)];
if((bills-_incomeTotal) > 0) then {
	IM setMarkerColor "ColorRed";
} else {
	IM setMarkerColor "ColorGreen";
}