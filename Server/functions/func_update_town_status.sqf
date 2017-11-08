
{
	(_x select 1) setMarkerText format["%1: $%2",(_x select 2),(_x select 3)];
	switch ((_x select 4)) do {
		case 0: {
			(_x select 0) setMarkerColor "colorCIV";
			(_x select 1) setMarkerType "loc_CivilDefense";
		 };
		 case 1: {
			(_x select 0) setMarkerColor "colorOPFOR";
			(_x select 1) setMarkerType "o_unknown";
		 };
		 case 2: {
			(_x select 0) setMarkerColor "colorBLUFOR";
			(_x select 1) setMarkerType "b_unknown";
		 };
		default { };
	};
} forEach ztownAll;
