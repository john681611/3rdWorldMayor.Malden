_result = ["Skip this month? <br/> Mayoral duties will be done on autopilot", "Confirm", true, true] call BIS_fnc_guiMessage;
if(_result) then {
	_date = [(date select 0),(date select 1)+1,1,9,0];
	setDate _date;
	bills = bills + 200; //replace with global variable to allow change in intrest rate
	[] call func_update_main_status;
};